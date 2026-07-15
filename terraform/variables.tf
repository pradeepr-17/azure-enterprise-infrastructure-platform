variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-aep-dev-01"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "Azure Enterprise Infrastructure Platform"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Development"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "vnet-aep-dev-01"
}

variable "vnet_address_space" {
  description = "VNet Address Space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_subnet_name" {
  default = "snet-public-01"
}

variable "public_subnet_prefix" {
  default = "10.0.1.0/24"
}

variable "private_subnet_name" {
  default = "snet-private-01"
}

variable "private_subnet_prefix" {
  default = "10.0.2.0/24"
}

variable "management_subnet_name" {
  default = "snet-management-01"
}

variable "management_subnet_prefix" {
  default = "10.0.3.0/24"
}

#############################
# Linux VM
#############################

variable "linux_vm_name" {
  default = "vm-linux-aep-01"
}

variable "linux_admin_username" {
  default = "azureuser"
}

variable "linux_vm_size" {
  default = "Standard_B2s_v2"
}

variable "linux_ssh_public_key" {
  description = "SSH public key for the Linux VM"
  type        = string
}

#############################
# Windows VM
#############################

variable "windows_vm_name" {
  default = "vm-windows-aep-01"
}

variable "windows_admin_username" {
  default = "azureadmin"
}

variable "windows_admin_password" {
  description = "Windows Administrator Password"
  type        = string
  sensitive   = true
}

variable "windows_vm_size" {
  default = "Standard_B2s_v2"
}
