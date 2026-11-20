# Stage 07 â€” Architecture and Design Rationale

## Design objective
Introduce a Windows management workload into the existing Azure enterprise landing zone without redefining networking created in earlier stages.

## Integration with earlier stages
The VM receives a network interface resource ID as an input. The NIC is implemented in Stage 06 and is attached through `network_interface_ids`. This separates network provisioning from compute provisioning and permits the module to be reused with a suitable existing NIC.

## Compute and operating system
The VM name, region, resource group and size are supplied by callers rather than hard-coded. The source image is Microsoft Windows Server 2022 Datacenter Azure Edition (`2022-datacenter-azure-edition`, version `latest`). The exact image version can change when a new VM is created; a pinned image version would be needed for strict build reproducibility.

## Disk design
The OS disk uses `Standard_LRS` storage and `ReadWrite` caching, as defined in the existing module. Disk performance, resilience and cost should be reviewed against workload requirements; no additional data disk is defined here.

## Identity design
A system-assigned managed identity is enabled on the VM. The module exports its principal ID, allowing downstream role assignments without embedding service principal credentials in the VM configuration. Identity creation alone does not grant Azure permissions.

## Credential and network security boundaries
The administrator password is passed as a sensitive Terraform variable. Terraform can still persist sensitive values in state; protect the backend, access permissions and secret delivery mechanism. The module does not itself configure Key Vault retrieval, NSG rules, patching, monitoring, Bastion or a public IP. Those controls must be verified in their respective configurations rather than assumed from this VM module.

## Dependency and design rationale
Stage 06 provides the NIC; Stage 07 consumes its ID. The module output provides the VM resource ID and managed identity principal ID for subsequent integrations. This keeps the landing-zone implementation modular while preserving a clear sequence from networking to compute.
