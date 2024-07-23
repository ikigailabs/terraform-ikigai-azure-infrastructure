resource "azurerm_role_assignment" "ingress_public_ip_reader_assignment" {
  scope              = azurerm_public_ip.ingress_public_ip.id
  role_definition_name = "Reader"
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}

resource "azurerm_role_definition" "ingress_app_gateway_contributor" {
  name        = var.ingress_gateway_contributor_role_name
  scope       = azurerm_application_gateway.ingress_application_gateway.id

  permissions {
    actions     = ["*"]
    not_actions = [
      "Microsoft.Authorization/*/Delete",
      "Microsoft.Authorization/*/Write",
      "Microsoft.Authorization/elevateAccess/Action",
      "Microsoft.Blueprint/blueprintAssignments/write",
      "Microsoft.Blueprint/blueprintAssignments/delete",
      "Microsoft.Compute/galleries/share/action",
      "Microsoft.Purview/consents/write",
      "Microsoft.Purview/consents/delete"
    ]
  }
}

resource "azurerm_role_assignment" "ingress_app_gateway_contributor_assignment" {
  scope              = azurerm_application_gateway.ingress_application_gateway.id
  role_definition_id = azurerm_role_definition.ingress_app_gateway_contributor.role_definition_resource_id
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}

resource "azurerm_role_definition" "ingress_app_gateway_identity_operator" {
  name        = var.ingress_gateway_identity_reader_role_name
  scope       = azurerm_user_assigned_identity.ingress_app_gateway_managed_identity.id

  permissions {
    actions = [
      "Microsoft.ManagedIdentity/userAssignedIdentities/*/read",
      "Microsoft.ManagedIdentity/userAssignedIdentities/*/assign/action",
      "Microsoft.Authorization/*/read",
      "Microsoft.Insights/alertRules/*",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/deployments/*",
      "Microsoft.Support/*"
    ]
  }
}

resource "azurerm_role_assignment" "ingress_app_gateway_identity_operator_assignment" {
  scope              = azurerm_user_assigned_identity.ingress_app_gateway_managed_identity.id
  role_definition_id = azurerm_role_definition.ingress_app_gateway_identity_operator.role_definition_resource_id
  principal_id       = data.azuread_service_principal.app_gateway_service_principal.object_id
}