# Day 1 – Networking Foundation

## Objective

Build the networking foundation for the Azure Enterprise Infrastructure Platform using Terraform.

---

## Tasks Completed

- Configured Terraform project structure
- Configured AzureRM Provider
- Configured Remote Backend using Azure Storage Account
- Initialized Terraform
- Created Azure Resource Group
- Created Virtual Network
- Created 3 Subnets
  - Public
  - Private
  - Management
- Created 3 Network Security Groups
- Associated NSGs with Subnets
- Created Static Public IP
- Stored Terraform State remotely

---

## Terraform Files Used

- backend.tf
- provider.tf
- versions.tf
- variables.tf
- locals.tf
- outputs.tf
- network.tf

---

## Azure Resources Created

| Resource | Name |
|----------|------|
| Resource Group | rg-aep-dev-01 |
| Virtual Network | vnet-aep-dev-01 |
| Public Subnet | snet-public-01 |
| Private Subnet | snet-private-01 |
| Management Subnet | snet-management-01 |
| Public NSG | nsg-public-aep-01 |
| Private NSG | nsg-private-aep-01 |
| Management NSG | nsg-management-aep-01 |
| Public IP | pip-linux-aep-01 |

---

## Terraform Commands Executed

terraform init

terraform validate

terraform plan

terraform apply

terraform state list

---

## Validation Performed

- Resource Group created successfully
- Virtual Network created successfully
- All three subnets verified
- NSGs verified
- NSG associations verified
- Static Public IP verified
- Remote Terraform state verified

---

### Git Repository Merge

Issue

GitHub repository already contained an initial commit which caused push rejection.

Resolution

Merged remote history, resolved .gitignore conflict, and pushed successfully.

---

## Key Learnings

- Terraform project structure
- Remote backend configuration
- Azure networking fundamentals
- Variables and locals
- Resource dependencies
- Terraform workflow
- Azure NSGs
- Git version control

---

## Next Steps

Provision compute resources:

- Ubuntu VM
- Windows VM
- Managed Identity
- Network Interfaces
- Secure NSG Rules