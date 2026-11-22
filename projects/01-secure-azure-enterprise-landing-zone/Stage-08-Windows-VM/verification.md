# Stage 08 — Terraform Verification

## Verification Objective

Verify that the Windows VM module integrates successfully with the existing Azure Enterprise Landing Zone without deploying resources.

## Validation Commands

Run from the `terraform` directory:

```powershell
terraform fmt -recursive
terraform init
terraform validate
terraform plan -var-file="env/dev/dev.tfvars"
```

## Validation Results

| Check | Result |
|---|---|
| Terraform Formatting | Passed |
| Provider and Module Initialization | Passed |
| Configuration Validation | Passed |
| Terraform Execution Plan | Passed |
| AzureRM Provider | v5.14.0 |
| Modules Initialized | 8 |

## Windows VM Verification

Terraform confirmed the planned creation of:

`module.windows_vm.azurerm_windows_virtual_machine.vm`

Verified attributes:

- Name: `dev-win-vm-01`
- Size: `Standard_D2s_v5`
- Location: `uksouth`
- OS: Windows Server 2022 Datacenter Azure Edition
- Administrator: `devadmin`
- Password: `(sensitive value)`
- Managed Identity: `SystemAssigned`
- OS Disk: `Standard_LRS`

The VM references the existing management network interface.

## Terraform Plan Result

```text
Plan: 28 to add, 0 to change, 0 to destroy.
```

This represents the cumulative 27 resources from Stage 07 plus one Windows VM.

## Output Verification

The execution plan confirmed the following new root outputs:

```text
windows_vm_id           = (known after apply)
windows_vm_principal_id = (known after apply)
```

## Security Verification

- Administrator password supplied through `TF_VAR_admin_password`.
- Password hidden in the Terraform plan output.
- No VM public IP resource configured.
- System-assigned managed identity enabled.

The password remains sensitive state data if the configuration is subsequently applied.

## Verification Limitations

Terraform planning does not verify actual Azure resource deployment, VM connectivity, effective network policies or successful Bastion access.

The existing management route `10.0.0.0/8` with next hop `None` requires review before live connectivity testing.

## Final Verification Status

**PASS — Terraform configuration validated successfully.**

**Deployment Status:** Not deployed. No `terraform apply` executed.
