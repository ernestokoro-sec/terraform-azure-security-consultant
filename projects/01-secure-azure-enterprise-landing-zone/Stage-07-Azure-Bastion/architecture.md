# Stage 07 - Azure Bastion Architecture

## Architecture Overview

The existing Azure landing zone is extended with Azure Bastion.

Resource Group: tf-dev-rg
|
+-- Virtual Network: dev-uks-vnet (10.10.0.0/16)
|   |
|   +-- Web Subnet: 10.10.1.0/24
|   +-- Application Subnet: 10.10.2.0/24
|   +-- Management Subnet: 10.10.3.0/24
|   +-- Private Endpoint Subnet: 10.10.4.0/24
|   +-- AzureBastionSubnet: 10.10.250.0/26
|
+-- Azure Bastion: dev-uks-bastion
|   +-- Standard SKU
|   +-- Static Standard Public IP: dev-uks-bastion-pip
|
+-- Management Network Interface: dev-mgmt-nic

## Design Rationale

### Why Azure Bastion?

Azure Bastion provides managed RDP and SSH connectivity to supported virtual machines without requiring public IP addresses on those virtual machines.

This reduces the need to expose administrative ports directly to the internet.

### Why a Dedicated Subnet?

Azure Bastion requires a subnet named AzureBastionSubnet.

The original design uses 10.10.250.0/26, providing a dedicated address range for the Bastion service.

### Why Standard SKU?

The Standard SKU supports additional administrative connectivity capabilities and scalability compared with the Basic SKU.

The Terraform configuration retains the original project's Standard SKU selection.

### Why a Static Standard Public IP?

The Bastion service requires an appropriately configured public IP resource for this deployment model.

The original module uses a Standard SKU public IP with Static allocation.

### Why Reference the Subnet Through a Module Output?

The expression:

module.subnets.subnet_ids["bastion"]

passes the Bastion subnet resource ID directly to the Bastion module.

Terraform can therefore determine the dependency between the subnet and Bastion host.

### Security Considerations

- Management VMs do not require public IP addresses for Bastion connectivity.
- Bastion resides in a dedicated subnet.
- Administrative access should be governed through appropriate identity, RBAC and network controls.
- The current configuration has not been deployed or tested for live connectivity.
- Production readiness requires review of Azure Bastion subnet NSG requirements and applicable organisational security policies.

## Implementation Status

Terraform configuration validated and planned successfully.

No Azure resources were deployed during this stage.
