# Stage 01 - Verification and Troubleshooting

## 1. Verification Scope

This document records the validation performed during
Stage 01 portfolio consolidation.

It distinguishes completed Terraform validation from
Azure deployment checks that were not rerun.

## 2. Verified Environment

- Terraform CLI: 1.13.1
- AzureRM Provider: 5.14.0
- Operating System: Windows
- Shell: PowerShell
- Target Azure Region: UK South
- Resource Group Configuration: tf-dev-rg

## 3. Terraform Formatting

Command:

    terraform fmt -check -recursive

Initial result:

Terraform identified six root configuration files
requiring formatting.

Corrective action:

    terraform fmt -recursive

Verification:

    terraform fmt -check -recursive
    $LASTEXITCODE

Observed exit code:

    0

Status: PASSED

## 4. Terraform Initialization

Command:

    terraform init -backend=false

Observed results:

- Resource Group child module initialized.
- AzureRM Provider 5.14.0 installed.
- Terraform initialization completed successfully.

Status: PASSED

The command did not initialize the active Azure
Storage backend.

## 5. Terraform Configuration Validation

Command:

    terraform validate

Observed result:

    Success! The configuration is valid.

Status: PASSED

## 6. Terraform Version Verification

Command:

    terraform version

Observed results:

    Terraform v1.13.1
    on windows_amd64

    provider registry.terraform.io/hashicorp/azurerm v5.14.0

Status: PASSED

## 7. Azure Resource Verification

The following commands can verify an independently
deployed Resource Group.

They were not rerun against Azure during this
portfolio consolidation.

Azure CLI authentication:

    az account show -o table

Resource Group inspection:

    az group show --name tf-dev-rg -o json

Resource Group existence:

    az group exists --name tf-dev-rg

Resource Group tags:

    az group show --name tf-dev-rg --query tags -o json

Resource Group location:

    az group show --name tf-dev-rg --query location -o tsv

These checks must be performed against the
intended Azure subscription.

## 8. Terraform State Verification

For an independently deployed modular Stage 01:

    terraform state list

Expected resource address:

    module.resource_group.azurerm_resource_group.rg

Inspect the managed resource:

    terraform state show module.resource_group.azurerm_resource_group.rg

The historical snapshot has not been deployed
against a new Terraform state during consolidation.

Do not run these commands expecting the resource
to exist in an uninitialized deployment state.

## 9. Troubleshooting Record

### Issue 01 - Terraform Formatting

Symptom:

    terraform fmt -check -recursive

returned a nonzero exit code and listed
configuration files requiring formatting.

Resolution:

    terraform fmt -recursive

The formatting check was repeated and returned
exit code 0.

### Issue 02 - PowerShell Here-String

Symptom:

PowerShell continued displaying the >> prompt.

Cause:

The closing here-string delimiter had not
been entered correctly.

Resolution:

The closing delimiter was entered and the
documentation file was successfully written.

### Issue 03 - Markdown Rendering

Symptom:

The architecture document contained an
incorrectly positioned Markdown code fence.

Resolution:

The extra fence was removed.

Verification:

The architecture document contained one
opening and one closing code fence.

## 10. Deployment Safety

The Stage 01 snapshot does not configure the
active project's remote backend.

Do not execute terraform apply or terraform destroy
against the existing integrated landing-zone state
using this historical configuration.

A separate test deployment requires:

- An explicitly selected Azure subscription.
- A unique test Resource Group name.
- Isolated Terraform state.
- A reviewed Terraform plan.
- Appropriate Azure permissions.

## 11. Verification Summary

| Check | Result |
|---|---|
| Terraform formatting | PASSED |
| Terraform initialization | PASSED |
| Terraform validation | PASSED |
| Terraform version inspection | PASSED |
| Git ignore verification | PASSED |
| Azure deployment from snapshot | NOT PERFORMED |
| Azure Resource Group live verification | NOT RERUN |

## 12. Engineering Conclusion

The standalone Stage 01 configuration passed
Terraform formatting, initialization and
configuration validation.

These results demonstrate that the Terraform
configuration is syntactically valid and that
its required provider and module dependencies
can be initialized.

They do not independently prove that a new
Azure Resource Group was deployed from this
historical snapshot.
