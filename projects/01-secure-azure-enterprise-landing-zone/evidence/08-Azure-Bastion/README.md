# Stage 08 — Azure Bastion

## Project
Secure Azure Enterprise Landing Zone

## Objective
Implement a reusable Azure Bastion Terraform module to provide managed access to private Azure virtual machines without assigning public IP addresses directly to those workloads.

## Azure Service
Azure Bastion

## Terraform Resource
`azurerm_bastion_host` and `azurerm_public_ip`

## Implementation
The module creates an Azure Bastion deployment with:

- Configurable Bastion host name, resource group and Azure region
- Standard SKU Bastion host
- Standard SKU public IP with static allocation
- Connection to the dedicated `AzureBastionSubnet` using its subnet resource ID
- Configurable resource tags
- Outputs for the Bastion resource ID and assigned public IP address

The public IP is associated with the Bastion service, not with the Stage 07 Windows management VM.

## Terraform Implementation
[View Stage 08 Terraform Configuration](main.tf)

Key files:

- [main.tf](main.tf) — Bastion host and public IP resources
- [variables.tf](variables.tf) — Module inputs
- [outputs.tf](outputs.tf) — Bastion ID and public IP outputs

## Architecture
See [Architecture and Design Rationale](architecture.md).

## Verification
See [Verification and Troubleshooting](verification.md).

## Stage 08 — Engineering Outcome

This stage extends the enterprise landing zone developed in Stages 01–07 by introducing Azure Bastion as a managed access path to the private Windows management VM defined in Stage 07.

The Terraform configuration provisions the Bastion host, its dedicated static public IP and the connection to `AzureBastionSubnet` through a reusable module.

This provides the management-access component for subsequent secure administration workflows while keeping public IP assignment off the Windows management VM.
