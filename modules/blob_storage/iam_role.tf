data "azuread_service_principal" "ikigai_service_principal" {
  display_name = var.service_principal_name
}

resource "azurerm_role_assignment" "storage_contributor_assignment" {
  scope                = azurerm_storage_account.development_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_service_principal.ikigai_service_principal.object_id
}