#############################################
# Action Group
#############################################

resource "azurerm_monitor_action_group" "main" {

  name                = "ag-enterprise"
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "alerts"

  email_receiver {
    name          = "Admin"
    email_address = var.alert_email
  }
}

#############################################
# CPU Alert Linux
#############################################
resource "azurerm_monitor_metric_alert" "linux_cpu" {

  name                = "Linux-High-CPU-Alert"
  resource_group_name = azurerm_resource_group.main.name

  scopes = [
    azurerm_linux_virtual_machine.linux.id
  ]

  description = "Alert when Linux VM CPU exceeds 40%"

  severity = 2
  enabled  = true

  frequency   = "PT1M"
  window_size = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 40
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

#############################################
# CPU Alert Windows
#############################################

resource "azurerm_monitor_metric_alert" "windows_cpu" {

  name                = "Windows-High-CPU-Alert"
  resource_group_name = azurerm_resource_group.main.name

  scopes = [
    azurerm_windows_virtual_machine.windows.id
  ]

  description = "Alert when Windows VM CPU exceeds 40%"

  severity = 2
  enabled  = true

  frequency   = "PT1M"
  window_size = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 40
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}
