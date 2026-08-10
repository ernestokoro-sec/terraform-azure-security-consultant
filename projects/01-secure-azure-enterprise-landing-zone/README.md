\# Project 01 — Secure Azure Enterprise Landing Zone



\## Project



\*\*Azure Cloud Security Consultant Portfolio\*\*



\*\*Enterprise Azure Security Engineering and Consulting using Terraform\*\*



\---



\## Executive Summary



This project demonstrates the design and implementation of a secure Azure enterprise landing zone using Terraform.



The objective is not to deploy isolated Azure resources, but to build a production-scoped security architecture that integrates networking, access control, routing, compute, identity, secrets management, private connectivity, storage security, monitoring and governance.



The project is being developed incrementally using reusable Terraform modules and a single central deployment root.



\---



\## Business Scenario



Contoso Financial Services is building a secure Azure environment for enterprise workloads.



The client requires an architecture that:



\- Provides clear network segmentation.

\- Controls inbound and outbound traffic.

\- Supports secure administrative access.

\- Minimises unnecessary Internet exposure.

\- Uses identity-based access instead of embedded credentials.

\- Protects secrets and sensitive data.

\- Supports private access to Azure PaaS services.

\- Provides central monitoring and security visibility.

\- Can be managed consistently through Terraform.

\- Can evolve into a larger enterprise architecture.



\---



\## Security Objectives



The landing zone is designed around the following principles:



\- Network segmentation

\- Least privilege

\- Controlled routing

\- Reduced public exposure

\- Identity-based authentication

\- Private connectivity

\- Central security monitoring

\- Infrastructure as Code

\- Repeatable deployment

\- Clear separation of responsibilities

\- Production-style Terraform architecture



\---



\## Current Architecture



```text

&#x20;                SECURE AZURE LANDING ZONE

&#x20;                          │

&#x20;                   Resource Group

&#x20;                          │

&#x20;                          ▼

&#x20;                     dev-uks-vnet

&#x20;                     10.10.0.0/16

&#x20;                          │

&#x20;         ┌────────────────┼────────────────┐

&#x20;         │                │                │

&#x20;         ▼                ▼                ▼

&#x20;    Web Subnet        App Subnet       Mgmt Subnet

&#x20;  10.10.1.0/24      10.10.2.0/24     10.10.3.0/24

&#x20;         │                │                │

&#x20;     dev-web-nsg      dev-app-nsg      dev-mgmt-nsg

&#x20;         │                │                │

&#x20;     dev-web-rt       dev-app-rt       dev-mgmt-rt

&#x20;                          │

&#x20;                          │

&#x20;               Private Endpoint Subnet

&#x20;                    10.10.254.0/26

