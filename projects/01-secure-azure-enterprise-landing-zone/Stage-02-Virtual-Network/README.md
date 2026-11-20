# Stage 02 — Resource Group + Azure Virtual Network

## Objective
Extend Stage 01 by deploying a reusable Azure Virtual Network within the existing Resource Group.

## Infrastructure
| Resource | Configuration |
|---|---|
| Resource Group | `tf-dev-rg` |
| Virtual Network | `dev-uks-vnet` |
| Address Space | `10.10.0.0/16` |
| Region | UK South |

## Implementation
Retained the Stage 01 Resource Group module and introduced the VNet module with reusable variables, outputs and consistent tagging.

## Validation
Terraform formatting, initialisation, validation and planning passed. **Plan: 2 add, 0 change, 0 destroy.** No deployment performed.

## Documentation
- [Architecture](./architecture.md)
- [Verification](./verification.md)
- [Terraform Code](./terraform/)

## Next Stage
Stage 03 — Subnet segmentation.