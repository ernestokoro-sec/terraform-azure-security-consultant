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
[View Stage 06 Terraform Configuration](main.tf)

Key files:

- `main.tf` — NIC resource configuration
- `variables.tf` — Module inputs
- `outputs.tf` — NIC resource ID and private IP outputs

## Architecture
See [Architecture and Design Rationale](architecture.md).

## Verification
See [Verification and Troubleshooting](verification.md).

## Stage 06 — Engineering Outcome

This stage extends the Azure enterprise landing zone established in Stages 01–05 by introducing the network interface required for the Windows management virtual machine.

The Terraform configuration defines a network interface with dynamic private IP allocation, subnet integration, resource tagging, and reusable outputs.

The implementation establishes the network connectivity component required for Stage 07 — Windows Management VM.

Detailed architecture decisions and verification procedures are documented in the accompanying files.
