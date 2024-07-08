resource "azurerm_cosmosdb_table" "connections_table" {
  name                = var.connections_table_name
  resource_group_name = data.azurerm_resource_group.development_rg.name
  account_name        = var.cosmosdb_account_name
}

resource "azurerm_cosmosdb_table" "facet_templates_table" {
  name                = var.facet_templates_table_name
  resource_group_name = data.azurerm_resource_group.development_rg.name
  account_name        = var.cosmosdb_account_name
}

resource "azurerm_cosmosdb_table" "lock_table" {
  name                = var.locks_table_name
  resource_group_name = data.azurerm_resource_group.development_rg.name
  account_name        = var.cosmosdb_account_name
}

resource "azurerm_cosmosdb_table" "pypr_lock_table" {
  name                = var.pypr_locks_table_name
  resource_group_name = data.azurerm_resource_group.development_rg.name
  account_name        = var.cosmosdb_account_name
}

resource "azurerm_cosmosdb_table" "remote_jobs_table" {
  name                = var.remote_jobs_table_name
  resource_group_name = data.azurerm_resource_group.development_rg.name
  account_name        = var.cosmosdb_account_name
}