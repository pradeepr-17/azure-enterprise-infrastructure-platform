####################################################
# Linux
####################################################

resource "azurerm_network_interface" "linux" {
  name                = "nic-linux-aep-01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux.id
  }

  tags = local.common_tags
}

resource "azurerm_managed_disk" "linux_data" {
  name                = "disk-linux-data-01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 64

  tags = local.common_tags
}

####################################################
# Ubuntu Linux Virtual Machine
####################################################

resource "azurerm_linux_virtual_machine" "linux" {
  name                = var.linux_vm_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = var.linux_vm_size

  admin_username = var.linux_admin_username

  network_interface_ids = [
    azurerm_network_interface.linux.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = var.linux_ssh_public_key
  }

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-linux-aep-01"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  boot_diagnostics {}

  tags = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux_data" {
  managed_disk_id    = azurerm_managed_disk.linux_data.id
  virtual_machine_id = azurerm_linux_virtual_machine.linux.id

  lun     = 0
  caching = "ReadWrite"
}

####################################################
# Windows
####################################################

resource "azurerm_network_interface" "windows" {
  name                = "nic-windows-aep-01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.management.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows.id
  }

  tags = local.common_tags
}

resource "azurerm_managed_disk" "windows_data" {
  name                = "disk-windows-data-01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 128

  tags = local.common_tags
}

####################################################
# Windows Server 2022 Virtual Machine
####################################################

resource "azurerm_windows_virtual_machine" "windows" {
  name                = var.windows_vm_name
  computer_name       = "win-aep01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = var.windows_vm_size

  admin_username = var.windows_admin_username
  admin_password = random_password.vm_admin.result

  network_interface_ids = [
    azurerm_network_interface.windows.id
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-windows-aep-01"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  boot_diagnostics {}

  automatic_updates_enabled = true
  patch_mode                = "AutomaticByPlatform"

  tags = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data" {
  managed_disk_id    = azurerm_managed_disk.windows_data.id
  virtual_machine_id = azurerm_windows_virtual_machine.windows.id

  lun     = 0
  caching = "ReadWrite"
}

####################################################
# Linux VM RBAC
####################################################

resource "azurerm_role_assignment" "linux_reader" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"
  principal_id         = azurerm_linux_virtual_machine.linux.identity[0].principal_id
}

####################################################
# Windows VM RBAC
####################################################

resource "azurerm_role_assignment" "windows_reader" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"
  principal_id         = azurerm_windows_virtual_machine.windows.identity[0].principal_id
}
