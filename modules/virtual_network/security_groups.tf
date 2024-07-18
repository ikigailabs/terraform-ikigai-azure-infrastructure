resource "azurerm_network_security_group" "ikigai_vnet_nsg" {
  name                = var.security_group_name
  location            = azurerm_resource_group.ikigai_rg.location
  resource_group_name = azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_subnet_network_security_group_association" "private_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.ikigai_vnet_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "database_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.database_subnet.id
  network_security_group_id = azurerm_network_security_group.ikigai_vnet_nsg.id
}