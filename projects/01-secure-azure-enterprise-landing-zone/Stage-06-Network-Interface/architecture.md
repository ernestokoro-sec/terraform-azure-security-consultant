
# Stage 06 — Network Interface Architecture

## Architecture Overview

The management Network Interface is connected to the management subnet within the existing Azure virtual network.

```text
Resource Group: tf-dev-rg
└── Virtual Network: dev-uks-vnet (10.10.0.0/16)
    ├── Web Subnet
    ├── Application Subnet
    ├── Management Subnet (10.10.3.0/24)
    │   └── Network Interface: dev-mgmt-nic
    └── Private Endpoint Subnet
```

The architecture retains the existing Network Security Groups, route tables, user-defined routes and subnet associations.

## Design Rationale

### Dedicated Management Interface

A dedicated NIC provides the network attachment required for a future management virtual machine.

### Management Subnet Placement

The NIC is placed in the management subnet to maintain separation between administrative workloads, web applications and other infrastructure.

### Private Connectivity

No public IP resource is configured for the NIC. This avoids introducing a direct public IP attachment to the future management workload.

### Dynamic Private IP Allocation

Azure allocates the private IP address dynamically from the management subnet.

A static allocation may be appropriate for workloads requiring a stable private IP, but is not required by this stage's existing design.

### Terraform Module Dependency

The NIC uses:

`module.subnets.subnet_ids["management"]`

This ensures the subnet reference is obtained from the existing Terraform module rather than hardcoded.

## Security Considerations

The NIC inherits the management subnet's network-level controls, including its associated NSG and route table.

The existing `10.0.0.0/8` UDR with next hop `None` must be considered when evaluating connectivity to other private networks.

## Deployment Status

Configuration validated and planned only. No Azure deployment was performed.
