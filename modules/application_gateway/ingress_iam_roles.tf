resource "azurerm_role_assignment" "ingress_public_ip_reader_assignment" {
  scope              = azurerm_public_ip.ingress_public_ip.id
  role_definition_name = "Reader"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}

resource "azurerm_role_assignment" "ingress_app_gateway_contributor_assignment" {
  scope              = azurerm_application_gateway.ingress_application_gateway.id
  role_definition_name = "Reader"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}

resource "azurerm_role_assignment" "ingress_app_gateway_identity_operator_assignment" {
  scope              = azurerm_user_assigned_identity.ingress_app_gateway_managed_identity.id
  role_definition_name = "Managed Identity Operator"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}