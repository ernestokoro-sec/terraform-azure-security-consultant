# Engagement 02 – Azure Virtual Network

## Project

**Azure Cloud Security Consultant Portfolio**

**Enterprise Azure Security Engineering and Consulting using Terraform**

---

## Objective

Deploy an Azure Virtual Network (VNet) using Terraform to provide a secure and scalable network foundation for Azure resources.

---

## Azure Service

- Azure Virtual Network (VNet)

---

## Terraform Resource

```hcl
azurerm_virtual_network
```

---

## Business Scenario

Contoso Financial Services requires a dedicated Virtual Network to host Azure resources securely.

The Virtual Network will provide private IP addressing and network isolation for future resources including subnets, virtual machines, Azure Bastion, Private Endpoints and Azure Firewall.

---

## Architecture

```text
Azure Subscription
        │
        ▼
Resource Group
        │
        ▼
Virtual Network
```

---

## Terraform Files

```text
02-Virtual-Network/

├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── architecture.md
├── verification.md
├── diagrams/
└── screenshots/
```

---

## Deployment

```powershell
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```

---

## Verification

Terraform

```powershell
terraform state list
```

Azure CLI

```powershell
az network vnet show `
    --resource-group tf-dev-rg `
    --name dev-uks-vnet `
    -o table
```

---

## Skills Demonstrated

- Azure Virtual Network
- Infrastructure as Code
- Terraform Variables
- Terraform Outputs
- Azure CLI Verification
- Git & GitHub Workflow

---

## Outcome

Successfully deployed an Azure Virtual Network using Terraform and verified the deployment using Terraform and Azure CLI.
