resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = azurerm_resource_group.ikigai_rg.name
  virtual_network_name = azurerm_virtual_network.ikigai_vnet.name
  address_prefixes     = [var.public_subnet_address_prefix]
}

resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = azurerm_resource_group.ikigai_rg.name
  virtual_network_name = azurerm_virtual_network.ikigai_vnet.name
  address_prefixes     = [var.private_subnet_address_prefix]

  service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.Storage"]
}

resource "azurerm_subnet" "database_subnet" {
  name                 = var.database_subnet_name
  resource_group_name  = azurerm_resource_group.ikigai_rg.name
  virtual_network_name = azurerm_virtual_network.ikigai_vnet.name
  address_prefixes     = [var.database_subnet_address_prefix]

  delegation {
    name = "postgresql_server_delegation"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
    }
  }
}

resource "azurerm_subnet" "application_gateway_subnet" {
  name                 = var.application_gateway_subnet_name
  resource_group_name  = azurerm_resource_group.ikigai_rg.name
  virtual_network_name = azurerm_virtual_network.ikigai_vnet.name
  address_prefixes     = [var.application_gateway_subnet_address_prefix]
}