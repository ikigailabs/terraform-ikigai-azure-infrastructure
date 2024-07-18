provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "ikigai_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "ikigai_vnet" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address_space]
  location            = azurerm_resource_group.ikigai_rg.location
  resource_group_name = azurerm_resource_group.ikigai_rg.name
}