# Day 3 – Secrets & Monitoring

## Objective
Secure VM credentials using Azure Key Vault and implement centralized monitoring using Azure Monitor.

## Resources Created
- Azure Key Vault
- Random Password
- Key Vault Secret
- RBAC Role Assignment
- Log Analytics Workspace
- Data Collection Rule (DCR)
- DCR Associations
- Azure Monitor Agent (Linux & Windows)

## Validation
- Verified Key Vault secret creation
- Verified DCR association
- Verified AMA installation
- Verified Heartbeat data in Log Analytics
- Verified VM Insights for both VMs

## Key Learnings
- Azure Key Vault secures secrets instead of hardcoding them.
- RBAC provides centralized authorization.
- DCR defines what telemetry is collected.
- AMA collects telemetry and sends it to Log Analytics.
- Heartbeat and VM Insights confirm monitoring is functioning.

## Commands Used
terraform fmt
terraform plan
terraform apply