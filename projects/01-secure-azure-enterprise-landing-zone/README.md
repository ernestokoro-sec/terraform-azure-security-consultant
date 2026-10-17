\# Project 01 — Secure Azure Enterprise Landing Zone

\## Project

\*\*Azure Cloud Security Consultant Portfolio\*\*

\*\*Enterprise Azure Security Engineering and Consulting using Terraform\*\*

\---



\## Executive Summary

This project demonstrates the design and implementation of a secure Azure enterprise landing zone using Terraform.

The objective is not to deploy isolated Azure resources, but to build a production-scoped security architecture that integrates networking, access control, routing, compute, identity, secrets management, private connectivity, storage security, monitoring and governance.

The project is being developed incrementally using reusable Terraform modules and a single central deployment root.

\---


\## Business Scenario

Contoso Financial Services is building a secure Azure environment for enterprise workloads.

The client requires an architecture that:

\- Provides clear network segmentation.

\- Controls inbound and outbound traffic.

\- Supports secure administrative access.

\- Minimises unnecessary Internet exposure.

\- Uses identity-based access instead of embedded credentials.

\- Protects secrets and sensitive data.

\- Supports private access to Azure PaaS services.

\- Provides central monitoring and security visibility.

\- Can be managed consistently through Terraform.

\- Can evolve into a larger enterprise architecture.



\---



\## Security Objectives

The landing zone is designed around the following principles:

\- Network segmentation

\- Least privilege

\- Controlled routing

\- Reduced public exposure

\- Identity-based authentication

\- Private connectivity

\- Central security monitoring

\- Infrastructure as Code

\- Repeatable deployment

\- Clear separation of responsibilities

\- Production-style Terraform architecture



\---

## Implementation Roadmap and Engineering Milestones

This Azure Enterprise Landing Zone has been developed incrementally through 18 engineering stages, progressing from foundational infrastructure to identity security, network segmentation, hybrid connectivity and Terraform engineering hardening.

Each stage extends the same integrated infrastructure rather than deploying an unrelated environment.

| Stage | Engineering Milestone | Status |
|---|---|---|
| 01 | Azure Resource Group and foundational infrastructure | Completed |
| 02 | Azure Virtual Network design and deployment | Completed |
| 03 | Subnet architecture and segmentation | Completed |
| 04 | Network Security Groups and traffic controls | Completed |
| 05 | Route Tables and User-Defined Routes | Completed |
| 06 | Management VM network interface | Completed |
| 07 | Windows management VM deployment | Completed |
| 08 | Azure Bastion secure administrative access | Completed |
| 09 | Azure Key Vault and workload RBAC integration | Completed |
| 10 | Private Endpoints, Private DNS and storage security | Completed |
| 11 | Security monitoring and network flow visibility | Completed |
| 12 | Microsoft Defender for Servers Plan 2 | Completed |
| 13 | Azure Policy and tag compliance | Completed |
| 14 | Hub-and-Spoke VNet peering architecture | Completed |
| 15 | Azure Firewall and forced spoke routing | Completed |
| 16 | Site-to-Site VPN and hybrid connectivity | Completed |
| 17 | Azure Virtual WAN architecture | Completed |
| 18 | Terraform engineering improvements and security hardening | Completed |
| 19 | Architecture capstone: Hub-and-Spoke versus Azure Virtual WAN | Planned |


**Status note:** Completed refers to the documented engineering stage and its committed implementation work. It does not imply that every resource remains deployed or that every configuration has passed a fresh production-readiness assessment.

### Key Engineering Capabilities Demonstrated

**Infrastructure as Code:** Reusable Terraform modules, environment-specific configurations, provider version management and Azure Storage remote-state backend.

**Network Security:** VNets, subnet segmentation, NSGs, route tables, Azure Firewall and controlled traffic routing.

**Identity and Secrets Management:** Azure RBAC, workload access controls and Azure Key Vault integration.

**Private Connectivity:** Private Endpoints, Private DNS and secured access to Azure services.

**Monitoring and Governance:** Network flow visibility, Microsoft Defender for Servers and Azure Policy.

**Hybrid Cloud Networking:** Hub-and-Spoke architecture, VPN Gateway, Local Network Gateway, Site-to-Site VPN and Azure Virtual WAN.

**Engineering Validation:** Terraform configuration checks, Azure Portal verification, troubleshooting and technical documentation.

### Architecture Evolution

The landing zone has evolved from a single-VNet foundational design into an enterprise-style architecture exploring traditional Hub-and-Spoke networking and Azure Virtual WAN.

The architecture diagrams and implementation evidence should be read alongside the Terraform configurations and Git commit history.

Stage 19 will evaluate the two connectivity approaches and document their architectural, security, operational and cost trade-offs.

---

## Foundational Architecture — Initial Landing Zone Design



```text
                 SECURE AZURE LANDING ZONE
                           │
                    Resource Group
                           │
                           ▼
                      dev-uks-vnet
                      10.10.0.0/16
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
     Web Subnet        App Subnet       Mgmt Subnet
   10.10.1.0/24      10.10.2.0/24     10.10.3.0/24
          │                │                │
     dev-web-nsg      dev-app-nsg      dev-mgmt-nsg
          │                │                │
     dev-web-rt       dev-app-rt       dev-mgmt-rt

               Private Endpoint Subnet
                    10.10.254.0/26 ```


