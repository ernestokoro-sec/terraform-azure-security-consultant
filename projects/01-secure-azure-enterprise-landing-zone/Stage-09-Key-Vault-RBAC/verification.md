# Stage 09 — Verification

## Terraform Commands

Run from the Stage 09 terraform directory:

- terraform fmt -recursive
- terraform fmt -check -recursive
- terraform init
- terraform validate
- terraform plan -var-file="env/dev/dev.tfvars"

## Verified Results

| Check | Result |
|---|---|
| Formatting | Passed |
| Initialization | Successful |
| AzureRM provider | v5.14.0 |
| Validation | Configuration is valid |
| Terraform plan | 30 to add, 0 to change, 0 to destroy |

## Stage 09 Resources

- Key Vault: dev-kv-ernest-sec-01
- RBAC role: Key Vault Secrets User
- Principal: Windows VM system-assigned managed identity
- Scope: Key Vault resource

## Limitations

- No terraform apply was executed.
- Azure deployment and connectivity were not tested.
- Private Endpoint and private DNS are not configured.
- Purge protection is disabled for this development lab.
- The existing management subnet route 10.0.0.0/8 to None requires connectivity assessment.
- Key Vault name availability and deployment permissions remain unverified.
