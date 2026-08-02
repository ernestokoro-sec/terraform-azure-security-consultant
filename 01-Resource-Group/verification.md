# Verification Guide

This document describes how to verify that the Azure Resource Group has been successfully deployed using Terraform, Azure CLI, and the Azure Portal.

---

# 1. Terraform Validation

Verify that the Terraform configuration is syntactically correct.

```powershell
terraform validate
```

**Expected Result**

```text
Success! The configuration is valid.
```

---

# 2. Terraform State

Confirm that Terraform is managing the Resource Group.

```powershell
terraform state list
```

**Expected Result**

```text
azurerm_resource_group.rg
```

---

# 3. Terraform Output

Display the deployed infrastructure.

```powershell
terraform show
```

Verify that the Resource Group name and location match the deployment.

---

# 4. Azure CLI Verification

Confirm that the Resource Group exists in Azure.

```powershell
az group show `
    --name tf-dev-rg `
    -o table
```

**Expected Output**

| Name | Location | ProvisioningState |
|------|----------|-------------------|
| tf-dev-rg | uksouth | Succeeded |

---

# 5. Azure Portal Verification

Navigate to:

```text
Azure Portal

↓

Resource Groups

↓

tf-dev-rg
```

Verify:

- Resource Group Name
- Azure Region
- Tags
- Provisioning State

---

# Verification Checklist

| Check | Status |
|---------|--------|
| Terraform Validate | ✅ |
| Terraform State | ✅ |
| Terraform Show | ✅ |
| Azure CLI | ✅ |
| Azure Portal | ✅ |

---

# Consultant Notes

Always verify deployments using more than one method.

Recommended order:

1. Terraform Validate
2. Terraform State
3. Azure CLI
4. Azure Portal

This approach confirms:

- Terraform configuration is valid.
- Terraform state matches Azure.
- Azure resources exist.
- The deployment is visible in the Azure Portal.

Using multiple verification methods reduces the risk of configuration drift and provides evidence that the deployment was successful.