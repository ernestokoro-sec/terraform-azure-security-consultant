# Stage 06 — Architecture and Design Rationale

## Architecture Overview

Management VM
    |
    v
Azure Network Interface
    |
    v
Configured Azure Subnet
    |
    v
Azure Virtual Network

## Consultant Design Rationale

The network interface provides the connectivity layer between an Azure virtual machine and its designated subnet.

### Why use a reusable Terraform module?

A dedicated network-interface module separates network interface configuration from virtual machine configuration.

This improves maintainability and allows the same module to be reused across environments.

### Why dynamic private IP allocation?

The implementation uses Azure-managed dynamic private IP allocation.

This avoids manually assigning an address within the subnet and simplifies initial deployment.

For workloads requiring a fixed private IP, a static allocation design would need to be evaluated.

### Why no public IP?

The module does not configure a public IP address.

This supports a private-connectivity design, although the complete security posture depends on the surrounding network, routing and access controls.

### Why use variables and outputs?

Variables allow the NIC to be configured for different environments without modifying the module source.

Outputs expose the NIC resource ID and assigned private IP address for integration with other Terraform resources.

## Security Considerations

- The selected subnet should be validated against the intended management-network design.
- Network Security Groups and routing policies must be evaluated separately.
- Administrative access should follow the landing zone's approved connectivity architecture.
- Resource tags should follow the organisation's governance standards.

## Implementation Reference

`terraform/modules/network-interface/`
