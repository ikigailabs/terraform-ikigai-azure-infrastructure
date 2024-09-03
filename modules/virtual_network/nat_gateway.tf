resource "azurerm_nat_gateway" "ikigai_nat_gateway" {
  name                    = var.nat_gateway_name
  location                = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name     = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_subnet_nat_gateway_association" "private_subnet_nat_gateway_association" {
  subnet_id      = azurerm_subnet.private_subnet.id
  nat_gateway_id = azurerm_nat_gateway.ikigai_nat_gateway.id
}

resource "azurerm_public_ip" "nat_gateway_public_ip" {
  name                = var.nat_gateway_public_ip_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_public_ip_association" {
  nat_gateway_id       = azurerm_nat_gateway.ikigai_nat_gateway.id
  public_ip_address_id = azurerm_public_ip.nat_gateway_public_ip.id
}