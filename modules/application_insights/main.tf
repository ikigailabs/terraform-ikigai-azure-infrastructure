terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.113.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Loading resource group
data "azurerm_resource_group" "ikigai_rg" {
  name     = var.resource_group_name
}

# Creating insight application resources 
resource "azurerm_log_analytics_workspace" "ikigai_workspace" {
  name                = var.log_analytics_workspace_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention
}

resource "azurerm_application_insights" "ikigai_insight" {
  name                = var.application_insights_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  workspace_id        = azurerm_log_analytics_workspace.ikigai_workspace.id
  application_type    = var.application_insights_type
}