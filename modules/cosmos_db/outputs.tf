output "cosmosdb_account_key" {
  value = azurerm_cosmosdb_account.cosmosdb_account.primary_key
  description = "Key for the Ikigai cosmosdb account"
}