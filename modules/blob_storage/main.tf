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

# Loading created resources
data "azurerm_resource_group" "ikigai_rg" {
  name     = var.resource_group_name
}

# Creating storage account
resource "azurerm_storage_account" "development_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.ikigai_rg.name
  location                 = data.azurerm_resource_group.ikigai_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  network_rules {
    default_action             = "Allow"
    virtual_network_subnet_ids = [var.private_subnet_id]
  }
}

# Creating azure storage containers
resource "azurerm_storage_container" "ikigai_cold_storage_dev" {
  name                  = var.cold_storage_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}

resource "azurerm_storage_container" "ikigai_connectors_dev" {
  name                  = var.connectors_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}

resource "azurerm_storage_container" "ikigai_custom_facet_dev" {
  name                  = var.custom_facet_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}

resource "azurerm_storage_container" "ikigai_datasets_dev" {
  name                  = var.dataset_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}

resource "azurerm_storage_container" "ikigai_models_dev" {
  name                  = var.models_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}

resource "azurerm_storage_container" "ikigai_sample_datasets" {
  name                  = var.sample_dataset_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}

resource "azurerm_storage_container" "ikigai_temp_dev" {
  name                  = var.temp_container_name
  storage_account_name  = azurerm_storage_account.development_storage_account.name
}