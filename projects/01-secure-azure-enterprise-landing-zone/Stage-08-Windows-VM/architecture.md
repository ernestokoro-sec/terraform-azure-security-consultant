# Stage 08 — Windows VM Architecture

## Architecture Overview

The Windows management VM is integrated into the existing Azure landing zone using private networking and reusable Terraform modules.

## Logical Architecture

    Azure Subscription
    |
    +-- Resource Group: tf-dev-rg
        |
        +-- VNet: dev-uks-vnet (10.10.0.0/16)
            |
            +-- AzureBastionSubnet
            |   +-- Azure Bastion
            |
            +-- Management Subnet (10.10.3.0/24)
                +-- Management NSG
                +-- Management Route Table
                +-- Management NIC
                    +-- Windows VM
                        +-- System-Assigned Managed Identity

## Terraform Dependencies

The Windows VM module consumes outputs from existing modules:

- `module.resource_group.resource_group_name`
- `module.network_interface.network_interface_id`

These references establish dependencies without hardcoding Azure resource IDs.

## Security Design

- **Private Access:** No public IP is directly attached to the VM.
- **Azure Bastion:** Intended to provide administrative access through the private network.
- **Network Segmentation:** The management subnet has a dedicated NSG and route table.
- **Managed Identity:** Supports identity-based access to Azure services when permissions are assigned.
- **Credential Handling:** The administrator password is supplied through `TF_VAR_admin_password`, not committed to `dev.tfvars`. Sensitive values may still be retained in Terraform state.

**Routing consideration:** The existing `10.0.0.0/8 → None` management route may interfere with Bastion connectivity and requires review before deployment.

## Consultant Design Rationale

**Dedicated Management VM**

Separates administrative workloads from application and web services, supporting clearer security boundaries.

**Existing Management Network**

Reusing the established subnet and NIC avoids unnecessary infrastructure duplication and maintains architectural consistency.

**Azure Bastion**

Provides an intended administrative access path without exposing the VM directly to the internet.

**System-Assigned Managed Identity**

Supports authentication to Azure services without separately managed application credentials.

**Modular Terraform Design**

Promotes reusable configurations, explicit resource dependencies and easier maintenance.

## Architecture Status

The architecture has been validated through Terraform planning. Live deployment and connectivity testing remain outside this engagement.
