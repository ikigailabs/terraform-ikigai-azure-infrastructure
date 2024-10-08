resource "azurerm_route_table" "igw_rtb" {
  name                          = var.route_table_name
  location                      = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name           = data.azurerm_resource_group.ikigai_rg.name
  bgp_route_propagation_enabled = true

  route {
    name           = "local"
    address_prefix = var.virtual_network_address_space
    next_hop_type  = "VnetLocal"
  }
}

resource "azurerm_subnet_route_table_association" "private_subnet_rtb_association" {
  subnet_id      = azurerm_subnet.private_subnet.id
  route_table_id = azurerm_route_table.igw_rtb.id
}

resource "azurerm_subnet_route_table_association" "database_subnet_rtb_association" {
  subnet_id      = azurerm_subnet.database_subnet.id
  route_table_id = azurerm_route_table.igw_rtb.id
}

resource "azurerm_subnet_route_table_association" "application_gateway_subnet_rtb_association" {
  subnet_id      = azurerm_subnet.application_gateway_subnet.id
  route_table_id = azurerm_route_table.igw_rtb.id
}