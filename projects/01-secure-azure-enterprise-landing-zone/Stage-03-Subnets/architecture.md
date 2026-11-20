# Stage 03 — Architecture and Design Rationale

## Architecture

```text
Azure Subscription
       |
Resource Group: tf-dev-rg
       |
VNet: dev-uks-vnet (10.10.0.0/16)
       |
       +-- Web Subnet         10.10.1.0/24
       +-- Application Subnet 10.10.2.0/24
       +-- Management Subnet  10.10.3.0/24
       +-- Private Endpoint   10.10.4.0/24
```

## Consultant Design Rationale

**Subnet Segmentation:** Separates web, application, management and private endpoint workloads into dedicated network boundaries.

**Address Allocation:** Each subnet receives a non-overlapping `/24` prefix within the existing VNet.

**Modular Terraform:** `for_each` enables consistent subnet provisioning without duplicating resource blocks.

**Private Endpoints:** The dedicated subnet has private endpoint network policies disabled in this historical configuration.

**Security Consideration:** Subnet separation alone does not enforce traffic isolation. NSGs are introduced in Stage 04. Default outbound access remains enabled in this snapshot.