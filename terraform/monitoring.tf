resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-azure-enterprise"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule" "main" {
  name                = "dcr-rule"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.main.id
      name                  = "law-destination"
    }
  }

  data_flow {
    streams      = ["Microsoft-Perf", "Microsoft-Syslog"]
    destinations = ["law-destination"]
  }

  data_sources {
    performance_counter {
      name                          = "performanceCounters"
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 60

      counter_specifiers = [
        "\\Processor(_Total)\\% Processor Time",
        "\\Memory\\Available MBytes",
        "\\LogicalDisk(_Total)\\% Free Space"
      ]
    }

    syslog {
      name           = "syslog"
      facility_names = ["*"]
      log_levels     = ["*"]
      streams        = ["Microsoft-Syslog"]
    }
  }

  description = "Collect performance counters and syslog from project VMs"

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule_association" "linux_vm" {
  name                    = "linux-dcr-association"
  target_resource_id      = azurerm_linux_virtual_machine.linux.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.main.id
}

resource "azurerm_monitor_data_collection_rule_association" "windows_vm" {
  name                    = "windows-dcr-association"
  target_resource_id      = azurerm_windows_virtual_machine.windows.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.main.id
}

resource "azurerm_virtual_machine_extension" "linux_ama" {
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = azurerm_linux_virtual_machine.linux.id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "windows_ama" {
  name                       = "AzureMonitorWindowsAgent"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows.id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  tags = local.common_tags
}
