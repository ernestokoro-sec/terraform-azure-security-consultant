# Stage 08 — Architecture and Design Rationale

## Architectural Context
Stages 01–07 establish the enterprise landing zone, networking, private network interface and Windows management VM. Stage 08 adds a managed remote-access service that can reach private VM addresses within the appropriate connected network.

## Design Decisions

### Dedicated Bastion subnet
The module accepts `bastion_subnet_id` rather than creating a subnet. The integrated deployment must supply the resource ID of a correctly named `AzureBastionSubnet`, created in an earlier networking stage. Azure Bastion requires its dedicated subnet; subnet sizing and route/security requirements must be checked against current Azure guidance.

### Public IP on the Bastion service
The module creates a Standard SKU static public IP and attaches it to the Bastion host. This is a public endpoint for the managed Bastion service, not a public IP assigned to the Windows management VM. The Stage 07 VM remains configured with the private NIC supplied by Stage 06.

### Standard SKU
The Bastion host uses Standard SKU, enabling a managed administrative access tier. Specific features and their availability depend on the Azure service configuration and platform support; this module does not configure optional Bastion features explicitly.

### Reusable configuration
Names, location, resource group, subnet ID and tags are supplied as variables. The module exposes the Bastion resource ID and public IP address for downstream integration and verification.

## Access Flow
Administrator -> Azure Bastion service -> private IP of Stage 07 Windows management VM (subject to identity, network and VM access controls).

## Security Boundaries
Bastion does not replace Entra authorization, VM sign-in permissions, network security rules, logging or guest OS hardening. The supplied Terraform module does not itself configure those controls. Verify them separately within the integrated landing-zone deployment.

## Consultant Design Rationale
The design centralizes administrative connectivity through a managed Azure service instead of assigning a public IP to the management VM. Keeping Bastion in its dedicated subnet separates the access tier from the workload subnet and supports a clearer enterprise security boundary.
