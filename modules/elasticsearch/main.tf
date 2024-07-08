provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "development_rg" {
  name = var.resource_group_name
}

resource "azurerm_elastic_cloud_elasticsearch" "monitor_elasticsearch" {
  name                        = var.monitor_elasticsearch_name
  resource_group_name         = data.azurerm_resource_group.development_rg.name
  location                    = data.azurerm_resource_group.development_rg.location
  sku_name                    = var.monitor_elasticsearch_sku
  elastic_cloud_email_address = var.monitor_elasticsearch_email
}

resource "azurerm_elastic_cloud_elasticsearch" "component_elasticsearch" {
  name                        = var.component_logs_elasticsearch_name
  resource_group_name         = data.azurerm_resource_group.development_rg.name
  location                    = data.azurerm_resource_group.development_rg.location
  sku_name                    = var.component_logs_elasticsearch_sku
  elastic_cloud_email_address = var.component_logs_elasticsearch_email
}