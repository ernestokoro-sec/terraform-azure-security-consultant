
# Stage 06 — Azure Network Interface

## Objective

Extend the secure Azure enterprise landing zone by introducing a dedicated Network Interface (NIC) for a future management virtual machine.

## Infrastructure

This stage adds one Azure Network Interface to the cumulative architecture established in Stages 01–05.

- Resource group: `tf-dev-rg`
- Virtual network: `dev-uks-vnet`
- Management subnet: `dev-mgmt-subnet`
- Subnet address range: `10.10.3.0/24`
- Network Interface: `dev-mgmt-nic`
- Private IP allocation: Dynamic
- Public IP: Not configured
- Region: UK South

## Terraform Implementation

Module: `terraform/modules/network-interface`

The NIC references the management subnet through the subnet module output.

## Validation Results

- `terraform fmt -recursive` — completed
- `terraform init -backend=false` — successful
- `terraform validate` — successful
- `terraform plan -var-file="env/dev/dev.tfvars" -refresh=false` — successful

Plan: **24 to add, 0 to change, 0 to destroy**.

No resources were deployed.

## Documentation

- [Architecture](architecture.md)
- [Verification](verification.md)

