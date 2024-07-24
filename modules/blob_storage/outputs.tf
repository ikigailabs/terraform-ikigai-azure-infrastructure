output "name" {
  value = azurerm_storage_account.development_storage_account.primary_access_key
  description = "Access key for the Ikigai storage account"
}