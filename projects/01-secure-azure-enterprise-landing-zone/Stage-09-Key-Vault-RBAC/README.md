# Stage 09 — Azure Key Vault & RBAC

## Objective
Integrate Azure Key Vault and role-based access control into the existing Terraform-managed Azure landing zone.

## Components
- Azure Key Vault with RBAC authorization enabled.
- Public network access disabled.
- Windows management VM system-assigned managed identity.
- Key Vault Secrets User role scoped to the Key Vault.
- Reusable Key Vault and RBAC Terraform modules.

## Verification
- Terraform formatting: Passed
- Terraform initialization: Successful
- Terraform validation: Passed
- Terraform plan: 30 to add, 0 to change, 0 to destroy
- Deployment: Not performed

## Documentation
- [Architecture](architecture.md)
- [Verification](verification.md)
