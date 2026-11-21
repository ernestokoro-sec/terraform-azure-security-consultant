# Stage 04 — Architecture and Consultant Design Rationale

## Architecture Overview

The Azure Enterprise Landing Zone contains one Virtual Network with four workload-specific subnets.

Three Network Security Groups provide subnet-level traffic filtering for the Web, Application, and Management tiers.

```text
Azure Resource Group: tf-dev-rg
|
+-- Virtual Network: dev-uks-vnet
    |   Address Space: 10.10.0.0/16
    |
    +-- Web Subnet: 10.10.1.0/24
    |   |
    |   +-- NSG: dev-web-nsg
    |       +-- Allow-HTTP  TCP/80
    |       +-- Allow-HTTPS TCP/443
    |
    +-- Application Subnet: 10.10.2.0/24
    |   |
    |   +-- NSG: dev-app-nsg
    |       +-- Azure default NSG rules
    |
    +-- Management Subnet: 10.10.3.0/24
    |   |
    |   +-- NSG: dev-mgmt-nsg
    |       +-- Azure default NSG rules
    |
    +-- Private Endpoint Subnet: 10.10.4.0/24
        |
        +-- No NSG association in Stage 04
```

## Design Rationale

The objective of this engagement was not simply to deploy Azure Network Security Groups, but to establish a modular network security architecture with clear separation between workload tiers.

Each workload subnet receives a dedicated NSG rather than sharing a single NSG across the entire Virtual Network.

This provides independent security policy management and allows different workload security requirements to be addressed without modifying unrelated NSGs.

### Why Each NSG Exists

**Web NSG — `dev-web-nsg`**

Protects the Web subnet and permits inbound HTTP and HTTPS traffic through explicitly configured security rules.

**Application NSG — `dev-app-nsg`**

Establishes a separate security policy boundary for application workloads. No custom rules are configured at this stage; Azure default NSG rules remain applicable.

**Management NSG — `dev-mgmt-nsg`**

Provides a dedicated policy boundary for management workloads. Restrictive administrative access rules have not yet been implemented.

### Why Subnet-Level Associations?

Subnet-level NSG associations establish consistent traffic filtering across resources deployed into each protected subnet.

This reduces the need to configure identical security rules individually on every network interface.

### Why Terraform Modules?

The reusable module separates NSG implementation logic from environment-specific configuration.

The root module supplies NSG definitions, security rules, and subnet associations.

This supports consistency, maintainability, and reuse across environments.

## Security Considerations

The Web NSG explicitly permits inbound TCP ports 80 and 443 from any source.

The Application and Management NSGs currently retain Azure default rules, including default Virtual Network traffic allowances.

Therefore, dedicated NSGs establish separate policy boundaries but do not, by themselves, enforce complete isolation between workload tiers.

Additional least-privilege rules and traffic restrictions would be required for production hardening.

## Design Outcome

Stage 04 establishes a reusable Terraform foundation for managing subnet-level network security policies while preserving the cumulative infrastructure from Stages 01–03.