terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.113.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "development_rg" {
  name     = var.resource_group_name
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = var.cosmosdb_account_name
  location            = data.azurerm_resource_group.development_rg.location
  resource_group_name = data.azurerm_resource_group.development_rg.name
  offer_type          = "Standard"

  consistency_policy {
    consistency_level = var.cosmosdb_consistency_level
  }

  geo_location {
    location          = var.cosmosdb_replication_region
    failover_priority = 0
  }

  capabilities {
    name = "EnableTable"
  }

  is_virtual_network_filter_enabled = true

  virtual_network_rule {
    id = var.private_subnet_id
  }
}