\# Enterprise Azure Landing Zone



This Landing Zone is the production-style implementation of the Azure Cloud Security Consultant Portfolio.



The individual engagement folders remain the learning and documentation layer, while the Landing Zone contains reusable Terraform modules used for deployment.



\## Architecture Overview



```text

Engagements 01–04              Engagement 05

Learning Projects              Route Tables

&#x20;      │                            │

&#x20;      └────────────┬───────────────┘

&#x20;                   ▼

&#x20;          ENTERPRISE LANDING ZONE

&#x20;                   │

&#x20;             Root main.tf

&#x20;                   │

&#x20;      ┌────────────┼──────────────┐

&#x20;      ▼            ▼              ▼

&#x20;Resource Group    VNet          Subnets

&#x20;                                 │

&#x20;                        ┌────────┴────────┐

&#x20;                        ▼                 ▼

&#x20;                       NSGs         Route Tables

