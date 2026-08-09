# Architecture

## Azure Virtual Network

The Azure Virtual Network (VNet) is the fundamental networking service in Microsoft Azure.

It provides a private network where Azure resources can communicate securely while remaining isolated from other Azure customers.

Every Virtual Machine, Azure Bastion, Private Endpoint, Application Gateway, Azure Firewall and many other Azure services rely on a Virtual Network.

---

# Architecture Diagram

```text
Azure Subscription
        │
        ▼
+----------------------+
|    Resource Group    |
|      tf-dev-rg       |
+----------------------+
           │
           ▼
+--------------------------------+
|     Virtual Network (VNet)      |
|      dev-uks-vnet               |
|     10.10.0.0/16                |
+--------------------------------+
```

---

# Design Considerations

The Virtual Network provides:

- Private IP addressing
- Network isolation
- Secure communication between Azure resources
- Foundation for subnet design
- Integration with VPN Gateway and ExpressRoute
- Connectivity to on-premises networks
- Support for Azure Private Link and Private Endpoints

---

# Why a Virtual Network?

Without a Virtual Network:

- Azure Virtual Machines cannot communicate privately.
- Azure Bastion cannot provide secure administrative access.
- Private Endpoints cannot be deployed.
- Azure Firewall has nowhere to be deployed.
- Network Security Groups cannot protect subnet traffic.

The Virtual Network is therefore the networking foundation of the Azure environment.

---

# Address Space

The Virtual Network uses:

```text
10.10.0.0/16
```

This address space allows approximately **65,536 IP addresses**, which can later be divided into multiple subnets.

---

# Consultant Design Decision

The Virtual Network is deployed before any subnet.

Reason:

Subnets cannot exist independently.

Every subnet belongs to one Virtual Network.

Therefore, the deployment order is:

```text
Resource Group
        │
        ▼
Virtual Network
        │
        ▼
Subnets
        │
        ▼
Network Security Groups
        │
        ▼
Virtual Machines
```

---

# Key Learning

The Virtual Network is the networking boundary of Azure infrastructure.

While the Resource Group provides a management boundary, the Virtual Network provides the network boundary upon which all secure communication is built.