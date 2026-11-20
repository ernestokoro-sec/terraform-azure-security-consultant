# Stage 01 - Architecture and Consultant Design Rationale

## 1. Business Context

Contoso Financial Services requires a repeatable and governed
foundation for deploying development infrastructure into Microsoft Azure.

The first engineering milestone is the creation of a dedicated
Azure Resource Group using Terraform.

## 2. Architecture Overview

Stage 01 introduces one Azure Resource Group within an existing
Azure subscription.

```text
Azure Subscription
        |
        v
+---------------------------+
| Azure Resource Group      |
|                           |
| Name: tf-dev-rg           |
| Region: UK South          |
| Environment: Development  |
| Managed By: Terraform     |
+---------------------------+
```
The root module passes the Resource Group name, Azure location
and tags to the reusable child module.

The child module creates the Resource Group and exposes its
resource ID and name as outputs.

## 3. Terraform Architecture

The root module orchestrates the reusable Resource Group module.

```text
terraform/
|-- main.tf
|-- variables.tf
|-- outputs.tf
|-- providers.tf
|-- versions.tf
|-- backend.tf
|-- env/
|   +-- dev/
|       +-- dev.tfvars.example
+-- modules/
    +-- resource-group/
        |-- main.tf
        |-- variables.tf
        |-- outputs.tf
        +-- versions.tf
```

The root module passes resource configuration to the child module.
The child module creates the Resource Group and exposes its ID and name.
## 4. Consultant Design Rationale
### Why use an Azure Resource Group?
The Resource Group provides a logical management boundary for
related Azure resources.

It supports resource organisation, lifecycle management,
governance, access control and cost attribution.

It does not provide network isolation.
### Why use Terraform?
Terraform provides declarative infrastructure provisioning,
repeatability, version control and a reviewable configuration.

This reduces dependence on manual Azure Portal operations.
### Why use a reusable module?
A reusable Resource Group module separates the resource
implementation from environment-specific configuration.

The module can be reused across different environments and
future infrastructure engagements.

This also establishes a consistent module interface for the
progressive landing-zone project.
### Why use input validation?
The child module validates that the Resource Group name and
location are not empty.

It also checks that tag keys and values are not empty.

This helps identify invalid input before deployment.
### Why use tags?
Tags provide useful metadata for resource organisation,
environment identification, governance and cost reporting.

The example configuration uses:
- Environment = dev
- Project = terraform-azure
- ManagedBy = Terraform
Azure does not automatically inherit all Resource Group tags
onto every child resource.

Later stages must apply appropriate tags to their resources.
## 5. Security and Governance Considerations
### Azure RBAC
Role assignments can be scoped to the Resource Group to
delegate management responsibilities.

Creating a Resource Group does not automatically configure
custom RBAC assignments.
### Azure Policy
Azure Policy can enforce organisational requirements such as
approved regions, resource types and mandatory tags.

No Azure Policy assignment is deployed in Stage 01.
### Terraform State
Terraform state may contain sensitive infrastructure information.

The historical Stage 01 snapshot intentionally does not
configure the active project's Azure Storage backend.

Independent deployments should use an isolated state backend.
### Resource Lifecycle
Deleting a Resource Group can delete resources contained within it.

Terraform destroy operations must therefore be carefully reviewed,
especially as subsequent stages introduce dependent resources.
## 6. Architecture Trade-offs
A single development Resource Group simplifies the initial lab
and provides a consistent foundation for the learning journey.

However, larger production environments may require multiple
Resource Groups to separate workloads, teams, environments
or resource lifecycles.

The appropriate design depends on organisational requirements,
ownership, governance and operational boundaries.
## 7. Progressive Architecture
Stage 01 establishes the Resource Group.

Stage 02 will retain the Resource Group and introduce the
Virtual Network.

Each subsequent stage will retain the infrastructure
configuration from preceding stages while introducing
additional Azure resources or security controls.

Stage 18 is intended to represent the complete integrated
landing-zone configuration.

Historical stages must not be applied against the active
integrated deployment state after later resources have
been introduced.
## 8. Engineering Evolution
The original Stage 01 implementation declared the Resource
Group directly in the root Terraform configuration.

During portfolio consolidation, the existing reusable
Resource Group module from the integrated project was
incorporated into the Stage 01 snapshot.

This change demonstrates progression from a simple resource
declaration towards modular infrastructure engineering.

The original implementation remains preserved in the
historical engagement evidence.
## 9. Learning Outcomes
After completing this engagement, the learner should understand:
- Azure Resource Group management boundaries.
- Root modules and child modules.
- Terraform variables and outputs.
- Terraform provider version constraints.
- Input validation and resource tagging.
- Terraform state isolation.
- Infrastructure configuration validation.
- The distinction between configuration validity and deployment evidence.
