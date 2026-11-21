# Stage 05 — Azure Route Tables and User-Defined Routes

## Engagement Overview

This engagement extends the Terraform Azure enterprise landing zone by introducing Azure Route Tables, User-Defined Routes (UDRs), and subnet associations.

The implementation uses the original reusable `route-tables` module and preserves the cumulative infrastructure from Stages 01–04.

**Environment:** dev  
**Region:** UK South  
**Status:** Terraform validated; not deployed

## Infrastructure Summary

| Component | Configuration |
|---|---|
| Resource Group | `tf-dev-rg` |
| Virtual Network | `dev-uks-vnet` — `10.10.0.0/16` |
| Subnets | Web, Application, Management, Private Endpoint |
| Network Security Groups | 3 NSGs, 2 custom rules, 3 associations |
| Route Tables | 3 |
| User-Defined Routes | 3 |
| Route Table Associations | 3 |

## Route Table Configuration

| Route Table | Associated Subnet | Route | Next Hop |
|---|---|---|---|
| `dev-web-rt` | `dev-web-subnet` | `10.0.0.0/8` | `None` |
| `dev-app-rt` | `dev-app-subnet` | `10.0.0.0/8` | `None` |
| `dev-mgmt-rt` | `dev-mgmt-subnet` | `10.0.0.0/8` | `None` |

All three route tables have BGP route propagation enabled. The Private Endpoint subnet has no route table association configured.

The `None` next hop drops traffic matching the effective route. Because `10.0.0.0/8` overlaps the VNet address space, these routes require review before production deployment.

## Terraform Implementation

**Module:** `terraform/modules/route-tables/`

Resources managed:

- `azurerm_route_table`
- `azurerm_route`
- `azurerm_subnet_route_table_association`

Environment configuration is defined in `terraform/env/dev/dev.tfvars`.

The management subnet reference uses `subnet_ids["management"]` to match Stage 03.

## Validation Results

```text
terraform validate
Success! The configuration is valid.

terraform plan -var-file="env/dev/dev.tfvars" -refresh=false
Plan: 23 to add, 0 to change, 0 to destroy.
```

**Stage 05 adds 9 planned resources. No Terraform apply was performed.**

For architectural decisions and validation evidence, see `architecture.md` and `verification.md`.