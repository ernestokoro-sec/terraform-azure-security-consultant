# Stage 05 — Terraform Verification and Evidence

## 1. Verification Scope

This document records the Terraform validation performed for Stage 05 — Azure Route Tables and User-Defined Routes.

The configuration includes the cumulative infrastructure from Stages 01–04 and introduces three route tables, three UDRs, and three subnet associations.

**Working directory:**

```text
projects/01-secure-azure-enterprise-landing-zone/
Stage-05-Route-Tables/terraform
```

**Environment:** `dev`  
**Deployment:** Not performed

## 2. Terraform Formatting

Command executed:

```powershell
terraform fmt -recursive
```

**Result:** Completed successfully without reported errors.

## 3. Terraform Initialization

Command used during Stage 05 preparation:

```powershell
terraform init -backend=false
```

This initializes the Terraform working directory without configuring the remote backend.

The subsequent validation and planning commands completed successfully.

## 4. Terraform Validation

Command executed:

```powershell
terraform validate
```

Actual output:

```text
Success! The configuration is valid.
```

**Result: PASSED**

## 5. Terraform Execution Plan

Command executed:

```powershell
terraform plan -var-file="env/dev/dev.tfvars" -refresh=false
```

Actual plan summary:

```text
Plan: 23 to add, 0 to change, 0 to destroy.
```

**Result: PASSED**

### Cumulative Resource Breakdown

| Terraform Resource | Count |
|---|---:|
| `azurerm_resource_group` | 1 |
| `azurerm_virtual_network` | 1 |
| `azurerm_subnet` | 4 |
| `azurerm_network_security_group` | 3 |
| `azurerm_network_security_rule` | 2 |
| `azurerm_subnet_network_security_group_association` | 3 |
| `azurerm_route_table` | 3 |
| `azurerm_route` | 3 |
| `azurerm_subnet_route_table_association` | 3 |
| **Total** | **23** |

## 6. Stage 05 Resource Verification

The Terraform plan confirmed the following route tables:

```text
dev-web-rt
dev-app-rt
dev-mgmt-rt
```

Each route table contains:

```text
Route Name:        block-private-10
Address Prefix:    10.0.0.0/8
Next Hop Type:     None
BGP Propagation:   Enabled
```

The plan also confirmed three subnet route table associations:

```text
web  -> dev-web-subnet
app  -> dev-app-subnet
mgmt -> dev-mgmt-subnet
```

The management association uses the existing `management` subnet output key.

## 7. Terraform Outputs Verified

The execution plan included the following Stage 05 outputs:

```text
route_table_ids
route_table_names
route_ids
route_table_subnet_association_ids
```

The route table names were displayed correctly. Resource IDs remain unknown until deployment.

## 8. Security and Deployment Observations

The plan confirms that each route table contains a UDR directing traffic for `10.0.0.0/8` to the `None` next hop.

This destination prefix overlaps the landing zone VNet address space.

The configuration was preserved from the original implementation, but its effect on legitimate internal connectivity requires assessment before production use.

Additional observations:

- All four subnets show `default_outbound_access_enabled = true` in the plan.
- No Azure effective-route verification was performed.
- No live connectivity testing was performed.
- No Azure resources were deployed.

## 9. Verification Conclusion

| Check | Result |
|---|---|
| Terraform formatting | Passed |
| Terraform validation | Passed |
| Terraform plan | Passed |
| Route tables planned | 3 |
| UDRs planned | 3 |
| Route table associations planned | 3 |
| Cumulative resources planned | 23 |
| Azure deployment | Not performed |

**Stage 05 Terraform configuration verification is complete.**