# Verification Guide

This document describes how to verify that the Azure subnets were successfully deployed using Terraform, Azure CLI and the Azure Portal.

---

# Prerequisites

Before verification, ensure:

- Terraform deployment completed successfully.
- Azure CLI is authenticated.
- The correct Azure subscription is selected.

---

# Azure Subscription Verification

Verify the current Azure subscription:

```powershell
az account show --query "{Subscription:name, SubscriptionID:id}" -o table
```

Example output:

```text
Subscription        SubscriptionID
------------------  ------------------------------------
Azure Subscription  xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

---

# Resource Group Verification

Verify the Resource Group exists:

```powershell
az group show `
    --name tf-dev-rg `
    --output table
```

Verify:

- Resource Group Name
- Location
- Provisioning State

---

# Virtual Network Verification

Verify the Virtual Network:

```powershell
az network vnet show `
    --resource-group tf-dev-rg `
    --name dev-uks-vnet `
    --output table
```

Verify:

- Virtual Network Name
- Address Space
- Resource Group

---

# Terraform Verification

## Check Terraform State

```powershell
terraform state list
```

Expected output:

```text
azurerm_subnet.subnet["web"]
azurerm_subnet.subnet["app"]
azurerm_subnet.subnet["mgmt"]
azurerm_subnet.subnet["private_endpoint"]
```

---

## View a Specific Subnet

Example:

```powershell
terraform state show azurerm_subnet.subnet["web"]
```

Verify:

- Name
- Resource Group
- Virtual Network
- Address Prefix

---

# Azure CLI Verification

## List All Subnets

```powershell
az network vnet subnet list `
    --resource-group tf-dev-rg `
    --vnet-name dev-uks-vnet `
    --output table
```

Expected output:

| Name | Address Prefix |
|------|----------------|
| dev-web-subnet | 10.10.1.0/24 |
| dev-app-subnet | 10.10.2.0/24 |
| dev-mgmt-subnet | 10.10.3.0/24 |
| dev-private-endpoint-subnet | 10.10.254.0/26 |

---

## Verify Individual Subnet

Example:

```powershell
az network vnet subnet show `
    --resource-group tf-dev-rg `
    --vnet-name dev-uks-vnet `
    --name dev-web-subnet `
    --output json
```

Verify:

- Address Prefix
- Resource ID
- Network Policies

---

# Azure Portal Verification

Navigate to:

```text
Azure Portal
    ↓
Resource Groups
    ↓
tf-dev-rg
    ↓
dev-uks-vnet
    ↓
Subnets
```

Verify:

- All four subnets exist.
- Address ranges are correct.
- No overlapping address spaces.
- Private Endpoint subnet exists.
- Resource Group matches the deployment.

---

# Validation Checklist

| Check | Status |
|--------|--------|
| Azure Subscription Verified | □ |
| Resource Group Verified | □ |
| Virtual Network Verified | □ |
| Terraform Apply Successful | □ |
| Terraform State Updated | □ |
| Web Subnet Created | □ |
| App Subnet Created | □ |
| Management Subnet Created | □ |
| Private Endpoint Subnet Created | □ |
| Azure CLI Verification Successful | □ |
| Azure Portal Verification Successful | □ |

---

# Common Verification Issues

## Subnet Not Found

Possible causes:

- Incorrect Resource Group
- Incorrect Virtual Network
- Terraform Apply failed

---

## Address Space Overlap

Check:

- Virtual Network Address Space
- Subnet CIDR ranges

Ensure every subnet fits inside:

```text
10.10.0.0/16
```

---

## Terraform State Missing

Run:

```powershell
terraform state list
```

If the subnet is missing:

```powershell
terraform apply
```

---

## Incorrect Azure Subscription

Verify the active subscription:

```powershell
az account show --query "{Subscription:name, SubscriptionID:id}" -o table
```

If required, change to the correct subscription:

```powershell
az account set --subscription "<Subscription Name or ID>"
```

---

# Consultant Verification

A Cloud Security Consultant never relies on a successful Terraform Apply alone.

Every deployment should be verified using four independent methods:

1. Azure Subscription
2. Terraform State
3. Azure CLI
4. Azure Portal

This four-layer verification process confirms that the infrastructure has been deployed correctly, exists in the intended subscription and resource group, and matches the approved design.

---

# Engagement Verification Complete

Once all checks pass:

- Terraform deployment is confirmed.
- Azure networking configuration is validated.
- The deployment exists in the correct Azure subscription.
- The environment is ready for the next engagement (Network Security Groups).