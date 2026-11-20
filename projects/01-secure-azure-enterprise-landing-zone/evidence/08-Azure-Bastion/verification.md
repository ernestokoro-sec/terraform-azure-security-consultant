# Stage 08 — Verification and Troubleshooting

## Scope
These are verification procedures, not a claim that deployment or live access testing has already succeeded. Execute commands from the integrated Project 01 Terraform root, and use the actual resource group and Bastion name from your environment.

## 1. Confirm Terraform source files
From the repository root:

```powershell
$module08 = '.\projects\01-secure-azure-enterprise-landing-zone\terraform\modules\bastion'
Get-Content "$module08\main.tf"
Get-Content "$module08\variables.tf"
Get-Content "$module08\outputs.tf"
```

## 2. Check formatting and configuration
From the integrated Terraform root:

```powershell
cd .\projects\01-secure-azure-enterprise-landing-zone\terraform
terraform fmt -check -recursive
terraform init
terraform validate
```

Only initialize against the configured backend when its credentials and access are available. `terraform fmt -check` reports formatting differences without modifying source files.

## 3. Review the deployment plan
Use the variable-file path that actually exists in the integrated Terraform root. For example, if the project uses `env/dev/dev.tfvars`:

```powershell
terraform plan -var-file='env/dev/dev.tfvars'
```

Review the planned `azurerm_bastion_host` and `azurerm_public_ip` resources. Confirm that the Bastion subnet ID points to `AzureBastionSubnet`, the public IP is Standard/Static, and the Bastion SKU is Standard. Do not apply solely for documentation purposes.

## 4. Verify Azure resources after deployment
Replace the placeholders with your actual resource group and Bastion host name:

```powershell
az network bastion show --resource-group '<RESOURCE_GROUP>' --name '<BASTION_NAME>' --output json
az network public-ip list --resource-group '<RESOURCE_GROUP>' --output table
az network vnet subnet list --resource-group '<RESOURCE_GROUP>' --vnet-name '<VNET_NAME>' --output table
```

Verify that the host exists, its IP configuration references the expected dedicated subnet and public IP, and the VM still has no public IP associated with its NIC.

## 5. Inspect Terraform state (if deployed and managed by this state)

```powershell
terraform state list
```

Locate the Bastion host and public IP resource addresses, then inspect an actual address from the list:

```powershell
terraform state show '<ACTUAL_RESOURCE_ADDRESS>'
```

Avoid publishing state outputs that contain sensitive information.

## 6. Functional access test
From the Azure portal, open the private Windows management VM and select the Bastion connection option. Confirm the authorized administrator can connect using the intended authentication method and that the VM has no directly assigned public IP. Record date, environment and outcome in the evidence log after performing the test.

## Troubleshooting

- Subnet error: confirm the subnet is named `AzureBastionSubnet` and meets current Azure size and configuration requirements
- Deployment failure: check region/SKU availability, resource-provider registration, RBAC permissions and policy restrictions
- Cannot connect to VM: confirm network reachability, NSG rules, VM status and guest OS remote-access configuration
- Terraform backend issue: verify state backend access before planning; do not create an unrelated local state to bypass production controls
- Unexpected resource replacement: inspect `terraform plan` and module inputs before applying

## Evidence Status
This file provides reproducible checks. Record actual command outputs and connection-test results only after they have been performed; do not describe unperformed checks as successful.
