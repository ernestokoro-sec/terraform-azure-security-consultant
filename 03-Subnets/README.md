# Engagement 03 – Azure Subnets

## Project

**Azure Cloud Security Consultant Portfolio**

**Enterprise Azure Security Engineering and Consulting using Terraform**

---

## Objective

Deploy multiple Azure subnets using Terraform to segment the Virtual Network into dedicated network zones for web, application, management and private endpoint workloads.

---

## Azure Service

- Azure Subnets

---

## Terraform Resource

```hcl
azurerm_subnet
```

---

## Business Scenario

Contoso Financial Services requires its Azure Virtual Network to be segmented into dedicated subnets.

The segmentation separates workloads by function and supports stronger security controls, clearer routing and easier future expansion.

The required subnets are:

- Web subnet
- Application subnet
- Management subnet
- Private Endpoint subnet

---

## Architecture

```text
dev-uks-vnet
10.10.0.0/16

├── dev-web-subnet
│   └── 10.10.1.0/24
│
├── dev-app-subnet
│   └── 10.10.2.0/24
│
├── dev-mgmt-subnet
│   └── 10.10.3.0/24
│
└── dev-private-endpoint-subnet
    └── 10.10.254.0/26
```

---

## Terraform Files

```text
03-Subnets/

├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── architecture.md
└── verification.md
```

---

## Terraform Pattern

This engagement uses:

```hcl
for_each = var.subnets
```

The subnet definitions are supplied through a:

```hcl
map(object())
```

This allows Terraform to create multiple subnets from one reusable resource block.

---

## Deployment

Create the local variable file:

```powershell
Copy-Item `
  .\terraform.tfvars.example `
  .\terraform.tfvars
```

Then run:

```powershell
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```

---

## Verification

Terraform:

```powershell
terraform state list
```

Azure CLI:

```powershell
az network vnet subnet list `
  --resource-group tf-dev-rg `
  --vnet-name dev-uks-vnet `
  -o table
```

---

## Skills Demonstrated

- Azure subnet design
- CIDR allocation
- Network segmentation
- Terraform `for_each`
- Terraform `map(object())`
- Terraform `for` expressions
- Terraform outputs
- Azure CLI verification

---

## Outcome

Successfully created multiple Azure subnets using one reusable Terraform resource block and verified the resulting network segmentation.