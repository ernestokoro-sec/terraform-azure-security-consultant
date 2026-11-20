# Stage 07 — Verification and Troubleshooting

## Verification scope
These are verification procedures for the existing Windows VM module. They are not a claim that a live deployment has been validated during documentation preparation.

## 1. Check the module source
From the repository root in PowerShell:

```powershell
$module07 = '.\projects\01-secure-azure-enterprise-landing-zone\terraform\modules\windows-vm'
Get-Content "$module07\main.tf"
Get-Content "$module07\variables.tf"
Get-Content "$module07\outputs.tf"
```

Confirm the VM consumes `var.network_interface_id`, enables `SystemAssigned` identity, and exports `vm_id` and `principal_id`.

## 2. Validate the integrated Terraform configuration
Change to the Project 01 Terraform root (the directory containing its root `main.tf` and provider configuration):

```powershell
Set-Location '.\projects\01-secure-azure-enterprise-landing-zone\terraform'
terraform fmt -check -recursive
terraform init
terraform validate
```

If the environment uses an existing remote backend, initialize with the established backend settings; do not silently switch backend or state. Locate the real variable file before planning:

```powershell
Get-ChildItem -Recurse -Filter '*.tfvars' | Select-Object FullName
```

Run `terraform plan -var-file="<verified-relative-path-to-dev.tfvars>"` only after confirming the actual variable-file path and Azure subscription context. Do not commit plan files or credentials.

## 3. Verify root-module integration

```powershell
Select-String -Path '.\main.tf' -Pattern 'module "compute"|module "windows|network_interface_id|admin_password' -Context 2,5
terraform state list
```

Check that the NIC output is passed into the Windows VM module and that any existing state address matches the configured module name. `terraform state list` alone does not prove that a VM is currently healthy.

## 4. Verify in Azure after deployment

```powershell
az account show --query '{subscription:name,id:id}' -o table
az vm show --resource-group '<resource-group>' --name '<vm-name>' --query '{name:name,location:location,vmId:vmId,identity:identity.principalId}' -o json
az vm get-instance-view --resource-group '<resource-group>' --name '<vm-name>' --query 'instanceView.statuses[].{code:code,displayStatus:displayStatus}' -o table
az vm nic list --resource-group '<resource-group>' --vm-name '<vm-name>' -o table
```

Replace placeholders with actual deployment values. Verify the VM is attached to the intended Stage 06 NIC and has the expected managed identity. Inspect NSG rules and management access separately; this module does not establish those controls.

## Troubleshooting
- **Undeclared or incorrect `network_interface_id`:** check the root module output reference and Stage 06 NIC ID; confirm both resources use the intended subscription and region.
- **VM size unavailable:** check regional size and quota restrictions before changing `vm_size`.
- **Image deployment failure:** confirm the selected image SKU is available in the target region.
- **Authentication or secret error:** check how `admin_password` is supplied, Key Vault permissions if used, and secure state access; never print passwords in logs.
- **Identity principal ID unavailable:** inspect VM provisioning state and `identity` configuration before attempting role assignments.
- **Terraform backend or lock errors:** verify remote backend permissions and active locks; do not delete state or force-unlock without confirming lock ownership.

## Evidence to capture when verified
Record the Terraform plan outcome, Azure VM provisioning and power status, NIC association, identity principal ID presence, and any remediations, with timestamps and sensitive values redacted.

