# Stage 03 — Verification and Troubleshooting

## Terraform Validation

| Command | Result |
|---|---|
| `terraform fmt -recursive` | Passed |
| `terraform init -backend=false` | Successful |
| `terraform validate` | Configuration valid |
| `terraform plan -var-file="env/dev/dev.tfvars" -refresh=false` | 6 add, 0 change, 0 destroy |

## Resources Verified in Plan

- Resource Group: `tf-dev-rg`
- Virtual Network: `dev-uks-vnet` (`10.10.0.0/16`)
- Subnets: `dev-web-subnet`, `dev-app-subnet`, `dev-mgmt-subnet`, `dev-pe-subnet`

## Inspection and Troubleshooting

```powershell
Get-Content .\main.tf
Get-Content .\variables.tf
Get-Content .\outputs.tf
Get-Content .\env\dev\dev.tfvars

Get-Content .\modules\subnets\main.tf
Get-Content .\modules\subnets\variables.tf
Get-Content .\modules\subnets\outputs.tf

terraform fmt -check -recursive
terraform validate
```

## Outcome
All six resources were confirmed in the Terraform execution plan. No Azure deployment performed.