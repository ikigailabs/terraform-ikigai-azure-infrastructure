resource "azurerm_role_assignment" "frontend_public_ip_reader_assignment" {
  scope              = azurerm_public_ip.frontend_public_ip.id
  role_definition_name = "Reader"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}

resource "azurerm_role_assignment" "frontend_app_gateway_contributor_assignment" {
  scope              = azurerm_application_gateway.frontend_application_gateway.id
  role_definition_name = "Contributor"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}

resource "azurerm_role_assignment" "frontend_app_gateway_identity_operator_assignment" {
  scope              = azurerm_user_assigned_identity.frontend_app_gateway_managed_identity.id
  role_definition_name = "Managed Identity Operator"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}