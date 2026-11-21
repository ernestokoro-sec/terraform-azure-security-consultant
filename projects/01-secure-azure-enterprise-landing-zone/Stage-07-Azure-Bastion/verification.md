# Stage 07 - Verification

## Working Directory

Stage-07-Azure-Bastion/terraform

## Commands Executed

### Format Terraform Configuration

terraform fmt -recursive

### Initialize Terraform Without Configuring the Backend

terraform init -backend=false

Result: Terraform successfully initialized.

Provider: hashicorp/azurerm v5.14.0

### Validate Terraform Configuration

terraform validate

Result:
Success! The configuration is valid.

### Generate Terraform Execution Plan

terraform plan -var-file="env/dev/dev.tfvars" -refresh=false

Result:
Plan: 27 to add, 0 to change, 0 to destroy.

## Stage 07 Resources Verified

1. module.subnets.azurerm_subnet.subnet["bastion"]
2. module.bastion.azurerm_public_ip.bastion
3. module.bastion.azurerm_bastion_host.bastion

## Configuration Verified

Bastion host: dev-uks-bastion
Bastion SKU: Standard
Public IP: dev-uks-bastion-pip
Public IP SKU: Standard
Public IP allocation: Static
Subnet: AzureBastionSubnet
Subnet prefix: 10.10.250.0/26
Region: uksouth
Resource group: tf-dev-rg

## Additional Verification Commands

Inspect Bastion configuration:

Get-Content .\modules\bastion\main.tf

Inspect subnet configuration:

Select-String -Path .\env\dev\dev.tfvars -Pattern "bastion" -Context 1,4

Inspect root Bastion module integration:

Select-String -Path .\main.tf -Pattern 'module "bastion"' -Context 0,15

## Troubleshooting Guidance

If Terraform reports an undeclared variable:
- Inspect root variables.tf.
- Confirm the variable name matches the module input.

If Terraform reports an invalid subnet map key:
- Confirm the bastion entry exists in dev.tfvars.
- Confirm the subnets module exposes subnet_ids.

If Terraform reports a missing module:
- Verify modules/bastion exists.
- Rerun terraform init -backend=false.

If the deployment is later attempted:
- Verify Azure Bastion prerequisites, subnet sizing, NSG requirements and permissions.

## Important Limitation

This stage was validated through Terraform planning only.

No terraform apply was executed.
No live Azure Bastion connectivity test was performed.
