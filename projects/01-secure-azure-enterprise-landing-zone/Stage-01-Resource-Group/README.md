# Stage 01 - Azure Resource Group

## Secure Azure Enterprise Landing Zone | Terraform

**Project:** Azure Cloud Security Engineering Portfolio
**Engagement:** 01 - Azure Resource Group
**Business Scenario:** Contoso Financial Services
**Environment:** Development
**Azure Region:** UK South

## Executive Summary

This engagement establishes the Azure Resource Group foundation
for a progressively developed enterprise Azure security landing zone.

The objective is to provide a consistent, repeatable and governed
management boundary for infrastructure deployed in subsequent stages.

Stage 01 deploys only the Resource Group. Later stages progressively
introduce networking, compute, identity-related controls, connectivity,
monitoring and security governance.

## Business Requirements

Contoso Financial Services requires:

1. A dedicated management container for development resources.
2. Consistent resource naming and tagging.
3. Repeatable infrastructure provisioning using Terraform.
4. A reusable implementation that supports future infrastructure.
5. A foundation for Azure RBAC, governance and cost management.

## Implemented Architecture

Azure Subscription
    |
    +-- Resource Group: tf-dev-rg
          |
          +-- Location: UK South
          +-- Environment: Development
          +-- Managed By: Terraform

No Virtual Networks, VMs, NSGs or other Azure resources are
deployed by this Stage 01 configuration.

## Terraform Implementation

The implementation uses a root module and a reusable
Resource Group child module.

Root module:
- main.tf
- variables.tf
- outputs.tf
- providers.tf
- versions.tf
- backend.tf

Reusable child module:
- modules/resource-group/main.tf
- modules/resource-group/variables.tf
- modules/resource-group/outputs.tf
- modules/resource-group/versions.tf

Environment example:
- env/dev/dev.tfvars.example

## Validation Evidence

The following commands were executed successfully during
Stage 01 portfolio consolidation:

- terraform fmt -check -recursive
- terraform init -backend=false
- terraform validate
- terraform version

Verified environment:

- Terraform CLI: 1.13.1
- AzureRM Provider: 5.14.0
- Terraform validation: Successful
- Terraform formatting: Successful

These checks establish configuration validity, not a new
Azure deployment from this snapshot.

## Security and Operational Considerations

- Terraform state must be protected against unauthorised access.
- Historical stages must not reuse the active landing-zone state.
- Azure RBAC should enforce least-privilege access.
- Resource naming and tagging should follow organisational standards.
- Sensitive configuration values must not be committed to GitHub.
- Deployment changes should be reviewed using terraform plan.

## Documentation

- architecture.md - Architecture and consultant design rationale
- verification.md - Verification and troubleshooting procedures
- terraform/ - Complete Stage 01 Terraform configuration
- diagrams/ - Architecture diagrams
- screenshots/ - Sanitised deployment evidence

## Deployment Safety

This historical snapshot does not configure the active Azure
Storage backend.

Do not apply this stage against the existing integrated
landing-zone Terraform state.

Independent deployment requires an isolated environment,
appropriate permissions and a reviewed Terraform plan.


