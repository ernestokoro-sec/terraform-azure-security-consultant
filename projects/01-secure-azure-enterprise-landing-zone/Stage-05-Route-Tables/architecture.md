# Stage 05 — Architecture and Design Rationale

## 1. Network Architecture

```text
Azure Subscription
|
+-- Resource Group: tf-dev-rg
    |
    +-- Virtual Network: dev-uks-vnet
        |   Address Space: 10.10.0.0/16
        |
        +-- Web Subnet: 10.10.1.0/24
        |   +-- NSG: dev-web-nsg
        |   +-- Route Table: dev-web-rt
        |       +-- 10.0.0.0/8 -> None
        |
        +-- Application Subnet: 10.10.2.0/24
        |   +-- NSG: dev-app-nsg
        |   +-- Route Table: dev-app-rt
        |       +-- 10.0.0.0/8 -> None
        |
        +-- Management Subnet: 10.10.3.0/24
        |   +-- NSG: dev-mgmt-nsg
        |   +-- Route Table: dev-mgmt-rt
        |       +-- 10.0.0.0/8 -> None
        |
        +-- Private Endpoint Subnet: 10.10.4.0/24
            +-- No NSG association configured
            +-- No route table association configured
```

## 2. Design Rationale

### Why dedicated route tables?

The Web, Application, and Management subnets serve different functions and may require different routing policies.

Using dedicated route tables provides independent control over each subnet's routing behaviour, rather than relying on a single shared routing configuration.

This also allows future changes, such as routing selected traffic through Azure Firewall, without redesigning the entire network.

### Why use User-Defined Routes?

Azure automatically provides system routes for virtual networks.

UDRs allow administrators to override applicable system routes and explicitly control how traffic reaches particular destinations.

The original engagement introduces a route named `block-private-10` in each route table:

```hcl
address_prefix = "10.0.0.0/8"
next_hop_type  = "None"
```

The `None` next hop instructs Azure to drop matching traffic when this route is selected.

### Why use Terraform modules?

The reusable `route-tables` module separates infrastructure logic from environment-specific configuration.

It uses `for_each` to create route tables and subnet associations, and nested iteration to generate individual UDRs.

This supports consistent deployments across environments.

## 3. Routing and Security Considerations

The current configuration demonstrates explicit route-based traffic dropping, but it is not a complete production network segmentation design.

**Important considerations:**

- `10.0.0.0/8` includes the VNet's `10.10.0.0/16` address space.
- The UDRs can disrupt legitimate communication between workload subnets.
- Azure route selection considers longest-prefix matching; a more-specific effective route can take precedence.
- NSGs and route tables perform different functions: NSGs filter traffic, while route tables influence forwarding.
- BGP route propagation remains enabled on all three route tables.

The routes are preserved from the original implementation for historical accuracy. They should be reviewed against application connectivity requirements before deployment.

## 4. Terraform Dependencies

```text
Resource Group
     |
Virtual Network
     |
   Subnets
     |
     +-------------------------+
     |                         |
Network Security Groups    Route Tables
     |                         |
NSG Associations           UDRs
                               |
                       Route Table Associations
```

The Route Tables module receives subnet IDs from the Subnets module, establishing the required Terraform dependencies.

The original management subnet lookup was adjusted from `subnet_ids["mgmt"]` to `subnet_ids["management"]` to match the existing Stage 03 output keys.

## 5. Design Outcome

Stage 05 demonstrates modular Azure routing configuration, subnet-specific route table associations, and the use of Terraform to manage network traffic forwarding policies.

The design is validated through Terraform but has not been deployed or tested against live Azure effective routes.