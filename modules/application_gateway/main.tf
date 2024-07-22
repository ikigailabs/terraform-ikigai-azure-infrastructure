provider "azurerm" {
  features {}
}

provider "azuread" {}

data "azuread_service_principal" "app_gateway_service_principal" {
  display_name = var.service_principal_name
}

data "azurerm_resource_group" "ikigai_rg" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "certificate_key_vault" {
  name                = var.domain_cert_key_vault_name
  resource_group_name = "certificate-resource-group"
}