# Stage 06 — Management VM Network Interface

## Project
Secure Azure Enterprise Landing Zone

## Objective
Implement a reusable Azure Network Interface (NIC) Terraform module to provide private network connectivity for a management virtual machine.

## Azure Service
Azure Network Interface

## Terraform Resource
`azurerm_network_interface`

## Implementation
The module creates an Azure network interface with:

- Configurable NIC name, resource group and location
- Connection to a subnet using its resource ID
- Dynamic private IPv4 address allocation
- Configurable resource tags
- Outputs for the NIC resource ID and private IP address

The module does not create or associate a public IP address.

## Terraform Implementation
[View Network Interface Module](../../terraform/modules/network-interface/)

Key files:

- `main.tf` — NIC resource configuration
- `variables.tf` — Module inputs
- `outputs.tf` — NIC resource ID and private IP outputs

## Architecture
See [Architecture and Design Rationale](architecture.md).

## Verification
See [Verification and Troubleshooting](verification.md).

## Implementation Evidence
The Terraform module is present in the repository.

Deployment status and live Azure verification must be confirmed separately.



## Terraform Source Snapshot

The `main.tf`, `variables.tf` and `outputs.tf` files in this evidence directory are copies of the reusable network-interface module.

The authoritative Terraform implementation remains in `terraform/modules/network-interface/`.

These files are provided for convenient source-code review and should not be maintained independently.
