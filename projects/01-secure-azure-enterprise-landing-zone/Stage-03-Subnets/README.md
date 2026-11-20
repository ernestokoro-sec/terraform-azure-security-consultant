# Stage 03 — Resource Group + Virtual Network + Subnets

## Objective
Extend Stage 02 by introducing subnet segmentation within the existing Azure Virtual Network.

## Infrastructure

| Resource | Configuration |
|---|---|
| Resource Group | `tf-dev-rg` |
| Virtual Network | `dev-uks-vnet` |
| Address Space | `10.10.0.0/16` |
| Region | UK South |
| Web Subnet | `dev-web-subnet` — `10.10.1.0/24` |
| Application Subnet | `dev-app-subnet` — `10.10.2.0/24` |
| Management Subnet | `dev-mgmt-subnet` — `10.10.3.0/24` |
| Private Endpoint Subnet | `dev-pe-subnet` — `10.10.4.0/24` |

## Implementation
Retained the Resource Group and VNet modules and introduced a reusable subnet module using Terraform `for_each`, structured variables and subnet outputs.

## Validation
Terraform formatting, initialisation, validation and planning passed. **Plan: 6 add, 0 change, 0 destroy.** No deployment performed.

## Documentation
- [Architecture](./architecture.md)
- [Verification](./verification.md)
- [Terraform Code](./terraform/)

## Next Stage
Stage 04 — Network Security Groups.