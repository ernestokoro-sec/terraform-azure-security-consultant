# Stage 09 — Architecture

## Architecture
The Windows management VM uses its system-assigned managed identity to authenticate to Azure services.

Azure RBAC assigns the Key Vault Secrets User role to this identity at the Key Vault resource scope.

## Security Configuration
- Key Vault SKU: Standard
- Authorization: Azure RBAC
- Public network access: Disabled
- Soft-delete retention: 7 days
- Purge protection: Disabled for the development lab

## Consultant Design Rationale

### Managed Identity
Eliminates the need to embed Azure service credentials in application configuration.

### Least-Privilege RBAC
Grants the VM identity secret-reading permissions without granting Key Vault administration privileges.

### Resource-Level Scope
Restricts the role assignment to the intended Key Vault rather than the resource group or subscription.

### Private Connectivity
Public network access is disabled. A Private Endpoint and appropriate DNS configuration are required for private secret access; these are not implemented in this engagement.

### Production Considerations
For production, enable purge protection, review soft-delete retention, and validate private connectivity. The existing management subnet route to 10.0.0.0/8 with next hop None also requires connectivity assessment.

These considerations are documented without changing the existing lab architecture.
