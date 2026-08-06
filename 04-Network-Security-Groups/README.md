# Engagement 04 – Network Security Groups

## Project

**Azure Cloud Security Consultant Portfolio**

**Enterprise Azure Security Engineering and Consulting using Terraform**

---

## Objective

Deploy Azure Network Security Groups (NSGs), define inbound security rules and associate the NSGs with the Web, Application and Management subnets.

---

## Azure Services

- Azure Network Security Groups
- Azure Network Security Rules
- Subnet-to-NSG Associations

---

## Terraform Resources

```hcl
azurerm_network_security_group
azurerm_network_security_rule
azurerm_subnet_network_security_group_association
```

---

## Business Scenario

Contoso Financial Services has completed its Azure network segmentation, but the subnets do not yet have traffic-filtering controls.

The client requires:

- Web traffic to be limited to HTTP and HTTPS.
- Management access to permit RDP only from the approved public IP address.
- The Application subnet to have no custom inbound Internet rule.
- The Private Endpoint subnet to remain outside this engagement.

---

## Security Requirements

### Web NSG

Allow:

- TCP 80
- TCP 443

### Management NSG

Allow:

- TCP 3389
- Source: `90.204.93.5/32`

### Application NSG

No custom inbound Internet rule.

Azure's default NSG rules remain in place.

---

## Architecture

```text
Internet
   │
   ├── TCP 80/443
   ▼
dev-web-nsg
   │
   ▼
dev-web-subnet

Approved Management IP
90.204.93.5/32
   │
   ├── TCP 3389
   ▼
dev-mgmt-nsg
   │
   ▼
dev-mgmt-subnet

Internet
   │
   ✕ No custom inbound rule
   ▼
dev-app-nsg
   │
   ▼
dev-app-subnet
```

---

## Terraform Files

```text
04-Network-Security-Groups/
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
for_each = var.network_security_groups
```

```hcl
for_each = var.security_rules
```

```hcl
for_each = var.subnet_associations
```

The `nsg_key` value links each security rule and subnet association to the correct NSG.

---

## Deployment

Create the local variables file:

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
az network nsg list `
  --resource-group tf-dev-rg `
  -o table
```

Verify the rules:

```powershell
az network nsg rule list `
  --resource-group tf-dev-rg `
  --nsg-name dev-web-nsg `
  -o table
```

Verify subnet associations:

```powershell
az network vnet subnet list `
  --resource-group tf-dev-rg `
  --vnet-name dev-uks-vnet `
  --query "[].{Subnet:name,NSG:networkSecurityGroup.id}" `
  -o table
```

---

## Skills Demonstrated

- Azure Network Security Groups
- Inbound security rules
- Rule priorities
- Subnet-to-NSG associations
- Terraform `for_each`
- Terraform `map(object())`
- Cross-resource references
- Azure CLI verification

---

## Outcome

Successfully deployed three Network Security Groups, configured approved inbound access and associated each NSG with the correct Azure subnet.