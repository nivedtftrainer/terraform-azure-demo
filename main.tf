terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}
resource "azurerm_storage_account" "stgacct" {
  name = "stgacctnv7890"
  resource_group_name = azurerm_resource_group.example.name
  account_tier = "Standard"
  location = azurerm_resource_group.example.location
  account_replication_type = "LRS"
}