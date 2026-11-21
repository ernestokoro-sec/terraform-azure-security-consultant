# Stage 04 — Azure Network Security Groups

## Overview

Stage 04 extends the Azure Enterprise Landing Zone by introducing Network Security Groups (NSGs), custom security rules, and subnet-level NSG associations.

The objective is to implement network traffic filtering and security segmentation using reusable Terraform modules.

## Cumulative Infrastructure

| Component | Configuration |
|---|---|
| Resource Group | `tf-dev-rg` |
| Azure Region | UK South |
| Virtual Network | `dev-uks-vnet` |
| VNet Address Space | `10.10.0.0/16` |
| Web Subnet | `dev-web-subnet` — `10.10.1.0/24` |
| Application Subnet | `dev-app-subnet` — `10.10.2.0/24` |
| Management Subnet | `dev-mgmt-subnet` — `10.10.3.0/24` |
| Private Endpoint Subnet | `dev-pe-subnet` — `10.10.4.0/24` |
| Network Security Groups | 3 |
| Custom Security Rules | 2 |
| Subnet–NSG Associations | 3 |

## Network Security Groups

| NSG | Associated Subnet | Purpose |
|---|---|---|
| `dev-web-nsg` | Web | Protect web-tier workloads |
| `dev-app-nsg` | Application | Protect application-tier workloads |
| `dev-mgmt-nsg` | Management | Separate management traffic |

The Private Endpoint subnet has no NSG association in this stage.

## Custom Security Rules

| Rule | NSG | Direction | Protocol | Port | Priority |
|---|---|---|---|---|---|
| Allow-HTTP | Web | Inbound | TCP | 80 | 100 |
| Allow-HTTPS | Web | Inbound | TCP | 443 | 110 |

Both rules permit traffic from any source address to any destination address.

The Application and Management NSGs currently use Azure's default security rules.

## Terraform Implementation

The implementation uses the reusable `network-security-groups` module.

The module manages:

- Network Security Group creation.
- Custom security rule creation.
- Subnet-to-NSG associations.

The root configuration connects NSGs to subnet IDs exported by the existing subnet module.

## Validation Status

- `terraform fmt -recursive` — Completed
- `terraform init -backend=false` — Successful
- `terraform validate` — Successful
- `terraform plan` — Successful

**Terraform plan: 14 to add, 0 to change, 0 to destroy.**

This is a historical configuration snapshot. No Azure resources were deployed during validation.

See `architecture.md` for design rationale and `verification.md` for validation evidence.