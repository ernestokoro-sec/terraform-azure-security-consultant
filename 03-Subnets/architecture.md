# Architecture

## Azure Subnet Design

Subnets divide the Azure Virtual Network into smaller network segments.

Each subnet is assigned a dedicated address range and is used for a specific workload or security function.

---

## Architecture Diagram

```text
Azure Subscription
        │
        ▼
Resource Group
tf-dev-rg
        │
        ▼
Virtual Network
dev-uks-vnet
10.10.0.0/16
        │
        ├── dev-web-subnet
        │   10.10.1.0/24
        │
        ├── dev-app-subnet
        │   10.10.2.0/24
        │
        ├── dev-mgmt-subnet
        │   10.10.3.0/24
        │
        └── dev-private-endpoint-subnet
            10.10.254.0/26
```

---

## Subnet Purpose

### Web Subnet

```text
dev-web-subnet
10.10.1.0/24
```

Hosts internet-facing or web-tier workloads.

Typical resources:

- Web servers
- Application Gateway
- Frontend services

---

### Application Subnet

```text
dev-app-subnet
10.10.2.0/24
```

Hosts internal application workloads.

Typical resources:

- Application servers
- Middleware
- Internal APIs

---

### Management Subnet

```text
dev-mgmt-subnet
10.10.3.0/24
```

Hosts administrative and management workloads.

Typical resources:

- Management virtual machines
- Monitoring tools
- Administrative services

---

### Private Endpoint Subnet

```text
dev-private-endpoint-subnet
10.10.254.0/26
```

Hosts Private Endpoint network interfaces.

Typical connected services:

- Azure Key Vault
- Storage Accounts
- Azure SQL Database
- Azure Container Registry

---

## Design Considerations

- Each subnet has a dedicated purpose.
- Address ranges must not overlap.
- Subnet ranges must remain inside the VNet address space.
- Network Security Groups will be applied in a later engagement.
- The private endpoint subnet is reserved for Azure Private Link resources.
- Future route tables can be associated with selected subnets.

---

## Address Planning

The VNet address space is:

```text
10.10.0.0/16
```

The current subnet allocation is:

| Subnet | Address Range | Purpose |
|---|---|---|
| Web | `10.10.1.0/24` | Web workloads |
| App | `10.10.2.0/24` | Application workloads |
| Management | `10.10.3.0/24` | Administrative workloads |
| Private Endpoint | `10.10.254.0/26` | Private Endpoint NICs |

This design leaves sufficient unused address space for future subnets.

---

## Consultant Design Decision

The subnets are separated by workload function rather than placing all resources into one large subnet.

This improves:

- Security segmentation
- Network policy enforcement
- Routing control
- Troubleshooting
- Future scalability

---

## Key Learning

A Virtual Network provides the overall private network boundary.

Subnets provide internal segmentation within that boundary.