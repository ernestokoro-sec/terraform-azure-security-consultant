# Stage 02 — Verification and Troubleshooting

## Terraform Validation

| Command | Result |
|---|---|
| `terraform fmt -recursive` | Passed |
| `terraform init -backend=false` | Successful |
| `terraform validate` | Configuration valid |
| `terraform plan -var-file="env/dev/dev.tfvars" -refresh=false` | 2 add, 0 change, 0 destroy |


## Resources Verified in Plan

- Resource Group: `tf-dev-rg`
- Virtual Network: `dev-uks-vnet` (`10.10.0.0/16`)

## Inspection and Troubleshooting

```powershell
Get-Content .\main.tf
Get-Content .\variables.tf
Get-Content .\outputs.tf
Get-Content .\env\dev\dev.tfvars

terraform fmt -check -recursive
terraform validate
```

## Outcome
Configuration and execution plan validated successfully. No Azure deployment performed.