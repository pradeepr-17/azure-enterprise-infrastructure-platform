# Day 2 – Enterprise Compute Infrastructure with Managed Identity

## Objective

The objective of Day 2 was to deploy a production-style compute infrastructure on Microsoft Azure using Terraform. This included provisioning both Linux and Windows virtual machines, attaching managed disks, configuring networking, enabling Managed Identity, assigning Azure RBAC permissions, and validating secure remote connectivity.

---

# Architecture

```
Azure Resource Group
│
├── Virtual Network
│   ├── Public Subnet
│   │   └── Ubuntu Linux VM
│   │       ├── Network Interface
│   │       ├── Public IP
│   │       ├── Managed OS Disk
│   │       ├── 64 GB Data Disk
│   │       └── System Assigned Managed Identity
│   │
│   └── Management Subnet
│       └── Windows Server 2022 VM
│           ├── Network Interface
│           ├── Public IP
│           ├── Managed OS Disk
│           ├── 128 GB Data Disk
│           └── System Assigned Managed Identity
│
└── Azure Role-Based Access Control
    ├── Reader Role → Ubuntu VM Managed Identity
    └── Reader Role → Windows VM Managed Identity
```

---

# Resources Created

## Virtual Machines

* Ubuntu Linux Virtual Machine
* Windows Server 2022 Virtual Machine

## Networking

* Linux Network Interface
* Windows Network Interface
* Linux Public IP Address
* Windows Public IP Address

## Storage

* Linux OS Disk
* Windows OS Disk
* Linux Managed Data Disk (64 GB)
* Windows Managed Data Disk (128 GB)

## Identity

* System Assigned Managed Identity (Ubuntu VM)
* System Assigned Managed Identity (Windows VM)

## Security

* Azure RBAC Reader Role assigned to both Managed Identities

## Diagnostics

* Boot Diagnostics enabled
* Automatic Windows Updates enabled

---

# Terraform Resources Used

* azurerm_linux_virtual_machine
* azurerm_windows_virtual_machine
* azurerm_network_interface
* azurerm_managed_disk
* azurerm_virtual_machine_data_disk_attachment
* azurerm_public_ip
* azurerm_role_assignment

---

# Deployment Steps

1. Created Linux and Windows Network Interfaces.
2. Created dedicated Public IP addresses.
3. Provisioned managed data disks.
4. Deployed Ubuntu Linux Virtual Machine.
5. Deployed Windows Server 2022 Virtual Machine.
6. Enabled System Assigned Managed Identity on both VMs.
7. Attached managed data disks.
8. Assigned Reader RBAC role to both Managed Identities.
9. Enabled Boot Diagnostics.
10. Validated Terraform configuration.
11. Executed Terraform Plan and Apply.
12. Successfully provisioned all Azure resources.

---

# Validation Performed

## Ubuntu VM

* Successfully connected through SSH using RSA private key.
* Verified hostname.
* Verified attached managed data disk.
* Installed Nginx Web Server.
* Confirmed Nginx service was running.
* Successfully accessed the Nginx welcome page through the browser.

## Windows VM

* Successfully connected through Remote Desktop Protocol (RDP).
* Verified Windows Server 2022 deployment.
* Confirmed Managed Identity was enabled.

## Azure Validation

Verified from Azure Portal:

* Virtual Machines
* Network Interfaces
* Public IP Addresses
* Managed Disks
* Boot Diagnostics
* Managed Identity
* RBAC Role Assignments

---

# Challenges Faced

## Windows Computer Name Limitation

Terraform deployment initially failed because the Windows computer name exceeded Azure's 15-character hostname limit.

### Resolution

Configured a shorter `computer_name` while keeping the Azure VM resource name descriptive.

---

## SSH Authentication Issue

SSH authentication initially failed when connecting without specifying the private key.

### Resolution

Used the local RSA private key explicitly:

```bash
ssh -i ~/.ssh/id_rsa azureuser@<Public-IP>
```

Successfully connected to the Ubuntu VM.

---

## Learning Outcomes

Through this implementation, I gained practical experience in:

* Infrastructure as Code using Terraform
* Azure Virtual Machine deployment
* Azure Networking
* Azure Managed Disks
* Azure Managed Identity
* Azure RBAC
* Boot Diagnostics
* Secure SSH authentication
* Windows RDP administration
* Linux server administration
* Nginx installation and validation
* Enterprise infrastructure deployment practices

---

# Screenshots Captured

* Terraform Apply Success
* Azure Resource Group Overview
* Ubuntu VM Overview
* Windows VM Overview
* Linux Managed Identity
* Windows Managed Identity
* Azure RBAC Role Assignment
* SSH Connection
* Windows RDP Connection
* Nginx Welcome Page
* Terraform Outputs

---

# Git Commit

```
Day 2: Deploy enterprise compute infrastructure with managed identities
```

---

# Summary

Day 2 successfully established the enterprise compute layer of the Azure infrastructure by deploying Ubuntu and Windows virtual machines with managed identities, additional managed storage, RBAC permissions, and secure remote connectivity. This environment now provides a strong foundation for implementing Azure Key Vault, Monitoring, Alerts, Automation, and CI/CD in the upcoming project phases.
