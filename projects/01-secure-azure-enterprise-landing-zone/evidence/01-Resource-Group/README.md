# Engagement 01 — Azure Resource Group

## Project

**Secure Azure Landing Zone using Terraform**

This engagement establishes the Azure Resource Group that serves as the management boundary for the Secure Azure Landing Zone project.

## Objective

Deploy an Azure Resource Group using Terraform to provide a consistent, repeatable, and governed foundation for all subsequent Azure resources.

## Azure Service

- Azure Resource Group

## Terraform Resource

- `azurerm_resource_group`

## Business Scenario

Contoso Financial Services is beginning its Azure cloud adoption journey.

The client requires a dedicated Resource Group to organise all development resources, support governance, simplify administration, and provide a management boundary for future infrastructure.

## Architecture

```text
Azure Subscription
        │
        ▼
Resource Group: tf-dev-rg
        │
        ├── Virtual Network
        ├── Subnets
        ├── Network Security Groups
        ├── Virtual Machine
        ├── Azure Bastion
        ├── Azure Key Vault
        ├── Log Analytics Workspace
        └── Private Endpoints
