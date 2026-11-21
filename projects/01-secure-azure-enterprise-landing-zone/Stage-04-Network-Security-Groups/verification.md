# Stage 04 — Terraform Verification and Validation

## Verification Objective

Verify that the cumulative Terraform configuration for Stages 01–04 is syntactically valid and produces the expected Azure infrastructure deployment plan.

Validation was performed without deploying resources.

## 1. Terraform Formatting

**Command**

```powershell
terraform fmt -recursive
```

**Result:** Completed successfully without reported formatting errors.

## 2. Terraform Initialisation

**Command**

```powershell
terraform init -backend=false
```

**Result:** Successful.

Terraform initialised the following modules:

- `resource_group`
- `network`
- `subnets`
- `network_security_groups`

The AzureRM provider was successfully initialised.

## 3. Terraform Configuration Validation

**Command**

```powershell
terraform validate
```

**Actual output**

```text
Success! The configuration is valid.
```

## 4. Terraform Execution Plan

**Command**

```powershell
terraform plan -var-file="env/dev/dev.tfvars" -refresh=false
```

**Actual result**

```text
Plan: 14 to add, 0 to change, 0 to destroy.
```

### Resource Breakdown

| Terraform Resource | Count |
|---|---:|
| Resource Group | 1 |
| Virtual Network | 1 |
| Subnets | 4 |
| Network Security Groups | 3 |
| Network Security Rules | 2 |
| Subnet–NSG Associations | 3 |
| **Total** | **14** |

## 5. NSG Verification

The Terraform plan confirmed the following NSGs:

```text
dev-web-nsg
dev-app-nsg
dev-mgmt-nsg
```

All three NSGs were configured for the `tf-dev-rg` Resource Group in UK South.

## 6. Security Rule Verification

The execution plan confirmed:

```text
Allow-HTTP
Priority: 100
Direction: Inbound
Protocol: TCP
Destination Port: 80
NSG: dev-web-nsg
```

```text
Allow-HTTPS
Priority: 110
Direction: Inbound
Protocol: TCP
Destination Port: 443
NSG: dev-web-nsg
```

Both rules use wildcard source and destination address prefixes.

## 7. Subnet Association Verification

The plan confirmed three subnet-to-NSG association resources:

```text
association["web"]
association["app"]
association["mgmt"]
```

These correspond to the Web, Application, and Management subnets.

The Private Endpoint subnet has no NSG association in this stage.

## 8. Terraform Outputs

The plan confirmed the following output maps:

```text
network_security_group_ids
network_security_group_names
security_rule_ids
subnet_association_ids
```

The resource IDs remain unknown until deployment.

## Final Validation Result

**Status: PASSED**

- Terraform formatting completed.
- Provider and modules initialised.
- Configuration validation passed.
- Execution plan generated successfully.
- All 14 expected resources accounted for.
- No Azure deployment performed.

**Conclusion:** The Stage 04 Terraform configuration is ready for version control as a validated historical infrastructure snapshot.