# Verification Guide

This document describes how to verify that the Azure Virtual Network has been successfully deployed using Terraform, Azure CLI and the Azure Portal.

---

# 1. Terraform Validation

Verify that the Terraform configuration is valid.

```powershell
terraform validate
```

**Expected Result**

```text
Success! The configuration is valid.
```

---

# 2. Terraform Plan

Review the execution plan before deployment.

```powershell
terraform plan
```

Confirm that Terraform plans to create:

```text
azurerm_virtual_network.vnet
```

---

# 3. Terraform Apply

Deploy the Virtual Network.

```powershell
terraform apply
```

Confirm:

```text
Apply complete!
```

---

# 4. Terraform State

Verify that Terraform is managing the Virtual Network.

```powershell
terraform state list
```

Expected output:

```text
azurerm_virtual_network.vnet
```

---

# 5. Terraform Outputs

Display the deployment outputs.

```powershell
terraform output
```

Verify:

- Virtual Network Name
- Virtual Network ID
- Address Space

---

# 6. Azure CLI Verification

Verify the Virtual Network exists.

```powershell
az network vnet show `
    --resource-group tf-dev-rg `
    --name dev-uks-vnet `
    -o table
```

Expected output:

| Name | Location | ProvisioningState |
|------|----------|-------------------|
| dev-uks-vnet | uksouth | Succeeded |

---

# 7. Azure Portal Verification

Navigate to:

```text
Azure Portal

↓

Resource Groups

↓

tf-dev-rg

↓

dev-uks-vnet
```

Verify:

- Virtual Network Name
- Address Space
- Resource Group
- Azure Region
- Provisioning State

---

# Verification Checklist

| Check | Status |
|---------|--------|
| Terraform Validate | ✅ |
| Terraform Plan | ✅ |
| Terraform Apply | ✅ |
| Terraform State | ✅ |
| Terraform Outputs | ✅ |
| Azure CLI | ✅ |
| Azure Portal | ✅ |

---

# Consultant Notes

Always verify deployments using multiple methods.

Recommended verification sequence:

1. Terraform Validate
2. Terraform Plan
3. Terraform Apply
4. Terraform State
5. Terraform Outputs
6. Azure CLI
7. Azure Portal

This approach confirms:

- The Terraform configuration is valid.
- The deployment succeeded.
- Terraform state matches Azure.
- The resource exists in Azure.
- The deployment is visible in the Azure Portal.

Using multiple verification methods provides confidence that the infrastructure has been deployed correctly and reduces the likelihood of configuration drift.