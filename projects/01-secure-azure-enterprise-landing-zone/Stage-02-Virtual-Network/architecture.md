# Stage 02 — Architecture and Design Rationale

## Architecture

```text
Azure Subscription
       |
  Resource Group
    tf-dev-rg
       |
  Virtual Network
   dev-uks-vnet
   10.10.0.0/16
```

## Consultant Design Rationale

**Dedicated VNet:** Establishes the private networking foundation for subsequent workload segmentation.

**Address Space:** `10.10.0.0/16` provides capacity for planned subnets and future expansion.

**Modular Terraform:** Separates networking from Resource Group provisioning for reuse and maintainability.

**Resource Dependency:** `module.resource_group.resource_group_name` links the VNet to its Resource Group.

**Security:** Subnet segmentation and NSG controls are introduced in subsequent stages.