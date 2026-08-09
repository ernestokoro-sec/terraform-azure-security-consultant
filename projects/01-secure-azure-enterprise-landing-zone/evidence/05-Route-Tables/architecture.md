\# Engagement 05 – Architecture



\## Portfolio to Enterprise Landing Zone



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

