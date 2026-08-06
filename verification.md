# Verification Guide

This document describes how to verify that the Azure Network Security Groups, security rules and subnet associations were successfully deployed.

---

# Azure Subscription Verification

Verify the active Azure subscription:

```powershell
az account show --query "{Subscription:name, SubscriptionID:id}" -o table
```

Confirm:

- Correct Azure subscription
- Correct Subscription ID

---

# Resource Group Verification

Verify the Resource Group:

```powershell
az group show `
    --name tf-dev-rg `
    --output table
```

Confirm:

- Resource Group exists
- Location is correct

---

# Terraform Verification

## Check Terraform State

```powershell
terraform state list
```

Expected resources:

```text
azurerm_network_security_group.nsg["web"]
azurerm_network_security_group.nsg["app"]
azurerm_network_security_group.nsg["mgmt"]

azurerm_network_security_rule.rule["allow-http"]
azurerm_network_security_rule.rule["allow-https"]
azurerm_network_security_rule.rule["allow-rdp"]

azurerm_subnet_network_security_group_association.association["web"]
azurerm_subnet_network_security_group_association.association["app"]
azurerm_subnet_network_security_group_association.association["mgmt"]
```

---

## Inspect a Network Security Group

Example:

```powershell
terraform state show azurerm_network_security_group.nsg["web"]
```

Verify:

- Name
- Resource Group
- Azure Region
- Tags

---

# Azure CLI Verification

## Verify Network Security Groups

```powershell
az network nsg list `
    --resource-group tf-dev-rg `
    --output table
```

Expected:

```text
dev-web-nsg
dev-app-nsg
dev-mgmt-nsg
```

---

## Verify Security Rules

Example:

```powershell
az network nsg rule list `
    --resource-group tf-dev-rg `
    --nsg-name dev-web-nsg `
    --output table
```

Verify:

- HTTP (80)
- HTTPS (443)

Management NSG:

```powershell
az network nsg rule list `
    --resource-group tf-dev-rg `
    --nsg-name dev-mgmt-nsg `
    --output table
```

Verify:

- RDP (3389)
- Source IP = 90.204.93.5/32

---

## Verify Subnet Associations

```powershell
az network vnet subnet list `
    --resource-group tf-dev-rg `
    --vnet-name dev-uks-vnet `
    --query "[].{Subnet:name,NSG:networkSecurityGroup.id}" `
    --output table
```

Confirm:

- dev-web-subnet → dev-web-nsg
- dev-app-subnet → dev-app-nsg
- dev-mgmt-subnet → dev-mgmt-nsg
- dev-private-endpoint-subnet → No NSG

---

# Azure Portal Verification

Navigate:

```text
Azure Portal
    ↓
Resource Groups
    ↓
tf-dev-rg
    ↓
Network Security Groups
```

Verify:

- Three NSGs exist.
- Rules are correctly configured.
- Priorities are correct.

Then navigate:

```text
Resource Groups
    ↓
tf-dev-rg
    ↓
dev-uks-vnet
    ↓
Subnets
```

Verify each subnet is associated with the correct NSG.

---

# Resource-Specific Verification

Unlike previous engagements, this verification focuses on security controls rather than infrastructure deployment.

Confirm:

- Web subnet permits only HTTP and HTTPS.
- Management subnet permits RDP only from `90.204.93.5/32`.
- Application subnet has no custom inbound Internet rule.
- Private Endpoint subnet remains unassociated.
- NSG priorities are unique and correctly ordered.

---

# Validation Checklist

| Check | Status |
|--------|--------|
| Azure Subscription Verified | □ |
| Resource Group Verified | □ |
| Three NSGs Created | □ |
| Three Subnet Associations Created | □ |
| HTTP Rule Verified | □ |
| HTTPS Rule Verified | □ |
| RDP Rule Verified | □ |
| Private Endpoint Subnet Unassociated | □ |
| Terraform State Verified | □ |
| Azure CLI Verified | □ |
| Azure Portal Verified | □ |

---

# Common Verification Issues

## NSG Not Found

Possible causes:

- Incorrect Resource Group
- Deployment failed
- Wrong subscription

---

## Subnet Association Missing

Check:

```powershell
terraform state list
```

Verify the association resources exist.

---

## Rule Priority Conflict

Azure requires every rule priority within an NSG to be unique.

Verify priorities before deployment.

---

## Incorrect Source Address

Verify that the Management NSG uses:

```text
90.204.93.5/32
```

and not:

```text
*
```

---

# Consultant Verification

A Cloud Security Consultant verifies not only that Network Security Groups exist, but also that they enforce the intended security policy.

Verification should confirm:

- Correct resource deployment.
- Correct rule implementation.
- Correct subnet association.
- Correct security posture.

The objective is to demonstrate that the network is protected according to the approved design rather than simply confirming that Azure resources were created.

---

# Engagement Verification Complete

Once all checks pass:

- Network Security Groups are deployed.
- Security rules are enforced.
- Subnets are protected.
- The Azure landing zone is ready for **Engagement 05 – Route Tables (UDRs)**.