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

data "azurerm_resource_group" "ikigai_rg" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "ikigai_vnet" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address_space]
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
}