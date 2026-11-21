
# Stage 06 — Verification

## Objective

Verify the Network Interface module and cumulative Terraform configuration without deploying Azure resources.

## Commands Executed

From `Stage-06-Network-Interface/terraform`:

```powershell
terraform fmt -recursive
terraform init -backend=false
terraform validate
terraform plan -var-file="env/dev/dev.tfvars" -refresh=false
```

## Observed Results

### Terraform Initialization

Six modules initialized:

- network
- network-interface
- network-security-groups
- resource-group
- route-tables
- subnets

AzureRM provider: `v5.14.0`.

### Configuration Validation

`Success! The configuration is valid.`

### Terraform Plan

`Plan: 24 to add, 0 to change, 0 to destroy.`

### Network Interface Verification

- Resource: `azurerm_network_interface`
- Name: `dev-mgmt-nic`
- Resource group: `tf-dev-rg`
- Region: `uksouth`
- IP configuration: `internal`
- IP allocation: `Dynamic`
- IP version: IPv4
- Subnet: Management subnet
- Public IP: Not configured

The NIC resource ID, assigned private IP and subnet ID remain unknown until deployment.

## Troubleshooting Reference

### Undeclared Variable

Check that `nic_name` is declared in root `variables.tf` and supplied in `env/dev/dev.tfvars`.

### Invalid Subnet Key

Verify that the NIC references:

`module.subnets.subnet_ids["management"]`

The subnet module does not expose the management subnet under the key `mgmt`.

### Missing Module

Verify that the following directory exists:

`terraform/modules/network-interface`

If the module source changes, rerun:

```powershell
terraform init -backend=false
```

## Deployment Status

No `terraform apply` was executed. This stage represents a validated, planned infrastructure configuration.
