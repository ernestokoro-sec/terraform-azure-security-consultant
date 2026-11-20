# Stage 01 - Azure Resource Group

## Objective

Establish a dedicated Azure Resource Group as the foundational management boundary for the Secure Azure Enterprise Landing Zone.

## Implementation

- **Resource Group:** `tf-dev-rg`
- **Azure Region:** UK South
- **Environment:** Development
- **Provisioning:** Terraform using a reusable Resource Group module
- **Tagging:** Environment, Project and ManagedBy

This stage establishes the Resource Group foundation for subsequent infrastructure stages.

## Validation

The following checks passed during Stage 01 consolidation:

- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate`

**Result:** Configuration validation successful. No new Azure deployment was performed from this historical snapshot.

## Technical Documentation

- [Architecture and Design Rationale](./architecture.md)
- [Verification and Troubleshooting](./verification.md)
- [Terraform Configuration](./terraform/)

## Next Stage

**Stage 02 - Azure Virtual Network:** Introduce the network foundation while retaining the Stage 01 Resource Group configuration.
