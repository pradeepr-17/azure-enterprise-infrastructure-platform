# Day 5 - GitHub Actions CI/CD Pipeline

## Objective

Automate Terraform validation using GitHub Actions to ensure infrastructure code quality before deployment.

---

## Technologies Used

- GitHub Actions
- Terraform
- Azure Service Principal
- Azure Resource Manager (AzureRM Provider)

---

## Tasks Completed

- Created GitHub Actions workflow (`.github/workflows/terraform.yml`)
- Configured Azure authentication using a Service Principal
- Added GitHub Repository Secrets
- Configured Azure Login in the workflow
- Implemented automatic execution of:
  - terraform fmt
  - terraform init
  - terraform validate
  - terraform plan
- Configured Terraform remote backend using Azure Storage Account
- Resolved Terraform state lock issue
- Configured Azure Key Vault RBAC permissions for GitHub Actions

---

## Workflow

1. Developer pushes code to the `main` branch.
2. GitHub Actions starts automatically.
3. A temporary Ubuntu runner is created.
4. Terraform is installed.
5. GitHub authenticates to Azure using the Service Principal.
6. Terraform checks code formatting.
7. Terraform initializes the Azure backend.
8. Terraform validates the configuration.
9. Terraform generates an execution plan.
10. Results are displayed in GitHub Actions.

---

## Outcome

The CI pipeline successfully validates Terraform infrastructure code on every push and prevents invalid infrastructure changes from reaching the main branch.

---

## Skills Demonstrated

- Infrastructure as Code (Terraform)
- GitHub Actions
- Azure Authentication
- Azure Service Principal
- CI/CD Pipeline
- Azure Storage Backend
- Azure Key Vault RBAC