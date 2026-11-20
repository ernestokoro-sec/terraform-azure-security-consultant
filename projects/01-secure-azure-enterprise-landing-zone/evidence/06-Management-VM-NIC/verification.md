# Stage 06 — Verification and Troubleshooting

## Objective

Verify the Terraform network-interface configuration and, where deployed, confirm the NIC's Azure properties.

## 1. Terraform Formatting

From the Project 01 Terraform root:

```powershell
terraform fmt -recursive
```

## 2. Terraform Validation

```powershell
terraform validate
```

## 3. Terraform Plan

Use the appropriate environment-specific variable file:

```powershell
terraform plan -var-file="env/dev/dev.tfvars"
```

Review the proposed actions before applying any changes.

## 4. Terraform State Inspection

```powershell
terraform state list
```

Identify the network-interface resource address if it is present in state.

## 5. Azure CLI Verification

List network interfaces in the target resource group:

```powershell
az network nic list --resource-group <resource-group-name> --output table
```

Inspect a specific NIC:

```powershell
az network nic show --resource-group <resource-group-name> --name <nic-name> --output json
```

Replace the placeholders with the actual deployed resource names.

## 6. Troubleshooting

### NIC not found
Confirm the subscription, resource group, NIC name and deployment state.

### Incorrect subnet
Compare the NIC's subnet resource ID with the intended subnet configuration.

### Unexpected private IP
Review the NIC's IP configuration and Azure-managed dynamic address allocation.

### Terraform state mismatch
Inspect the Terraform resource address and current state before making changes.

## Verification Evidence Status

The Terraform module source has been reviewed.

No new Terraform plan, deployment, Azure CLI verification or live resource output was supplied during this documentation consolidation.

Do not interpret the commands above as evidence that they have been executed successfully.
