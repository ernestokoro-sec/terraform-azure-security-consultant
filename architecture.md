# Architecture

## Azure Network Security Design

This engagement introduces Azure Network Security Groups (NSGs) to enforce network traffic filtering at the subnet level.

Each production subnet receives its own dedicated NSG, allowing security policies to be managed independently.

---

# High-Level Architecture

```text
                    Internet
                        │
        ┌───────────────┴───────────────┐
        │                               │
     TCP 80/443                     TCP 3389
        │                               │
        ▼                               ▼
  dev-web-nsg                    dev-mgmt-nsg
        │                               │
        ▼                               ▼
 dev-web-subnet                dev-mgmt-subnet
        │                               │
        └──────────────┐        ┌────────┘
                       │        │
                       ▼        ▼
                   dev-app-nsg
                       │
                       ▼
                 dev-app-subnet

Private Endpoint Subnet
        │
        ▼
No NSG (Reserved for future engagement)
```

---

# NSG Allocation

| Subnet | Network Security Group |
|----------|------------------------|
| dev-web-subnet | dev-web-nsg |
| dev-app-subnet | dev-app-nsg |
| dev-mgmt-subnet | dev-mgmt-nsg |
| dev-private-endpoint-subnet | None |

---

# Security Policy

## Web Network Security Group

Inbound Rules

| Source | Destination Port | Action |
|---------|------------------|--------|
| Internet | 80 | Allow |
| Internet | 443 | Allow |

Purpose

Allows public web traffic while relying on Azure's default rules to deny unwanted inbound traffic.

---

## Management Network Security Group

Inbound Rules

| Source | Destination Port | Action |
|---------|------------------|--------|
| 90.204.93.5/32 | 3389 | Allow |

Purpose

Restricts Remote Desktop access to the approved management workstation only.

---

## Application Network Security Group

Inbound Rules

No custom inbound Internet rules.

Purpose

The Application subnet remains isolated from direct Internet access. Communication with other workloads will be introduced in later engagements.

---

# Rule Processing

Azure evaluates NSG rules in ascending priority order.

Example:

```text
Priority 100
↓

Priority 110
↓

Priority 120
↓

Default Azure Rules
```

The first matching rule determines whether the traffic is allowed or denied.

---

# Design Decisions

- One NSG per subnet.
- Security policies separated by workload.
- Management access restricted to a single trusted IP.
- Private Endpoint subnet excluded until the Private Link engagement.
- Rule priorities reserved to allow future expansion.

---

# Consultant Considerations

Before deploying NSGs, a Cloud Security Consultant should verify:

- Required application ports.
- Administrative access requirements.
- Source IP restrictions.
- Future network segmentation.
- Private Endpoint strategy.
- Hybrid connectivity requirements.

---

# Key Learning

A subnet provides network segmentation.

A Network Security Group provides traffic filtering.

Together they form the foundation of Azure network security.