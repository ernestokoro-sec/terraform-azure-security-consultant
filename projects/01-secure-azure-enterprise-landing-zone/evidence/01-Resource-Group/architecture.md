# Architecture

## Azure Resource Group

The Azure Resource Group is the management boundary for this engagement.

It provides a logical container that groups related Azure resources so they can be managed, secured, monitored and deleted together.

## Architecture Diagram

```text
Azure Subscription
        │
        ▼
+----------------------+
|    Resource Group    |
|      tf-dev-rg       |
+----------------------+
        │
        ├── Virtual Network
        ├── Network Security Groups
        ├── Virtual Machines
        ├── Azure Bastion
        ├── Azure Key Vault
        ├── Log Analytics Workspace
        ├── Private Endpoints
        └── Other Azure Resources
```

## Design Considerations

- The Resource Group is a **management boundary**, not a network boundary.
- Azure RBAC permissions are commonly assigned at the Resource Group scope.
- Azure Policies can be assigned to enforce governance.
- Tags applied at this level improve resource organisation and cost reporting.
- Resources can communicate across Resource Groups if networking allows.

## Key Learning

The Resource Group is the foundation of Azure governance. Every subsequent engagement in this portfolio will deploy resources into this management boundary.