\# Engagement 05 – Azure Route Tables (UDRs)



\## Client Engagement



This engagement extends the Azure security architecture developed in Engagements 01–04 by introducing Azure Route Tables and User Defined Routes (UDRs).



The objective is to control subnet traffic paths rather than relying exclusively on Azure system routes.



\## Security Objective



The implementation demonstrates how a Cloud Security Consultant can use Azure Route Tables to:



\- Control traffic paths at subnet level.

\- Override selected Azure system routes using UDRs.

\- Understand route selection and Longest Prefix Match.

\- Understand the interaction between System Routes, BGP Routes and UDRs.

\- Prepare workloads for controlled routing through security appliances such as Azure Firewall.

\- Support hybrid connectivity architectures involving VPN Gateway, ExpressRoute and Virtual WAN.

\- Identify and plan for overlapping IP address spaces during cloud migration.



\## Implemented Architecture

dev-uks-vnet
10.10.0.0/16
│
├── dev-web-subnet
│   10.10.1.0/24
│   ├── dev-web-nsg
│   └── dev-web-rt
│
├── dev-app-subnet
│   10.10.2.0/24
│   ├── dev-app-nsg
│   └── dev-app-rt
│
├── dev-mgmt-subnet
│   10.10.3.0/24
│   ├── dev-mgmt-nsg
│   └── dev-mgmt-rt
│
└── dev-private-endpoint-subnet
    10.10.254.0/26

Three route tables were created:



\- `dev-web-rt`

\- `dev-app-rt`

\- `dev-mgmt-rt`



They were associated with the Web, Application and Management subnets respectively.



Each route table contains the following UDR:



`10.0.0.0/8 → None`



The route is used in this lab to demonstrate explicit route control and Azure route-selection behaviour.



\## Enterprise Landing Zone Integration

Engagements 01–04              Engagement 05
Learning Projects              Route Tables
       │                            │
       └────────────┬───────────────┘
                    ▼
           ENTERPRISE LANDING ZONE
                    │
              Root main.tf
                    │
       ┌────────────┼──────────────┐
       ▼            ▼              ▼
 Resource Group    VNet          Subnets
                                  │
                         ┌────────┴────────┐
                         ▼                 ▼
                        NSGs         Route Tables

Engagement 05 also introduced the production-style Landing Zone operating model.



The original engagement folders remain educational portfolio evidence.



Reusable Terraform implementations are integrated into:



`landing-zone/modules/`



The Route Table implementation resides in:



`landing-zone/modules/route-tables/`



All infrastructure is orchestrated from:



`landing-zone/main.tf`



This allows the environment to be deployed and destroyed centrally rather than executing Terraform separately from each engagement directory.



\## Terraform Workflow



From the Landing Zone root:



```powershell

terraform fmt -recursive

terraform init

terraform validate

terraform plan -var-file="env/dev/dev.tfvars"

terraform apply -var-file="env/dev/dev.tfvars"

