terraform {
  backend "azurerm" {
    resource_group_name  = "rg-aep-tfstate-01"
    storage_account_name = "storeaep1"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}