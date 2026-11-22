# Stage 08 — Windows Management VM

## Engagement Overview

This engagement extends the Azure Enterprise Landing Zone by integrating a Windows Server 2022 management VM using Terraform.

The implementation builds upon the infrastructure established in Stages 01–07.

## Objectives

- Integrate the reusable Windows VM module.
- Reuse the existing management network interface.
- Configure a Windows Server 2022 management workload.
- Enable a system-assigned managed identity.
- Handle administrator credentials securely during Terraform planning.
- Validate the cumulative infrastructure without deployment.

## Implementation Summary

| Property | Value |
|---|---|
| VM Name | dev-win-vm-01 |
| Region | UK South |
| VM Size | Standard_D2s_v5 |
| Operating System | Windows Server 2022 Datacenter Azure Edition |
| Network Interface | dev-mgmt-nic |
| Managed Identity | SystemAssigned |

Terraform module: `terraform/modules/windows-vm`

Environment configuration: `terraform/env/dev/dev.tfvars`

## Engagement Outcome

The Windows VM module was successfully integrated into the existing Terraform configuration.

**Terraform Plan: 28 to add, 0 to change, 0 to destroy.**

No Azure resources were deployed.

## Documentation

- [Architecture](architecture.md) — Architecture and consultant design rationale.
- [Verification](verification.md) — Terraform validation and plan evidence.
