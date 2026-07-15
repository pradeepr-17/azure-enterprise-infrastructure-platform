output "linux_vm_name" {
  value = azurerm_linux_virtual_machine.linux.name
}

output "windows_vm_name" {
  value = azurerm_windows_virtual_machine.windows.name
}

output "linux_public_ip" {
  value = azurerm_public_ip.linux.ip_address
}

output "windows_public_ip" {
  value = azurerm_public_ip.windows.ip_address
}

output "linux_identity_principal_id" {
  value = azurerm_linux_virtual_machine.linux.identity[0].principal_id
}

output "windows_identity_principal_id" {
  value = azurerm_windows_virtual_machine.windows.identity[0].principal_id
}