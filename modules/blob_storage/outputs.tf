output "storage_account_access_key" {
  value = azurerm_storage_account.ikigai_storage_account.primary_access_key
  description = "Access key for the Ikigai storage account"
  sensitive = true
}