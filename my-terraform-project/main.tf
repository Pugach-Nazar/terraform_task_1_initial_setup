terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mate_terraform" {
  name     = "mate-terraform-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "mate_terraform" {
  name                     = "mate-terraform-storage"
  resource_group_name      = azurerm_resource_group.mate_terraform.name
  location                 = azurerm_resource_group.mate_terraform.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}