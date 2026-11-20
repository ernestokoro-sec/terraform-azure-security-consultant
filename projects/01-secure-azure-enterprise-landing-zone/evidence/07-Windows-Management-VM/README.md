# Stage 07 — Windows Management VM

## Project
Secure Azure Enterprise Landing Zone

## Objective
Implement a reusable Windows Virtual Machine Terraform module for a management workload, using the private network interface established in Stage 06.

## Azure Service
Azure Virtual Machines

## Terraform Resource
`azurerm_windows_virtual_machine`

## Implementation
The module creates a Windows management virtual machine with:

- Configurable VM name, resource group, location and size
- Administrator username and sensitive password input
- Attachment to the network interface provided by Stage 06
- A Standard_LRS operating-system disk with ReadWrite caching
- Windows Server 2022 Datacenter Azure Edition image
- System-assigned managed identity
- Configurable resource tags
- Outputs for the VM resource ID and managed identity principal ID

The module attaches an existing NIC rather than creating a public IP address. Password sensitivity controls Terraform display, but does not remove secrets from state; secure handling of state and credentials remains necessary.

## Terraform Implementation
[View Stage 07 Terraform Configuration](main.tf)

Key files:

- [main.tf](main.tf) — Windows VM resource configuration
- [variables.tf](variables.tf) — Module inputs
- [outputs.tf](outputs.tf) — VM resource ID and managed identity principal ID outputs

## Architecture
See [Architecture and Design Rationale](architecture.md).

## Verification
See [Verification and Troubleshooting](verification.md).

## Stage 07 — Engineering Outcome

This stage extends the enterprise landing zone developed in Stages 01â€“06 by defining the Windows management virtual machine that uses the private network interface introduced in Stage 06.

The Terraform configuration combines a Windows Server 2022 image, configurable compute settings, operating-system storage, network attachment and system-assigned managed identity into a reusable VM module.

The managed identity principal ID is exposed for identity-aware integration and role assignments in subsequent stages where required.

