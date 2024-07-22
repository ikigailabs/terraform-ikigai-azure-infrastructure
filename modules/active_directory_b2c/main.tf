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

# Loading created resources
data "azurerm_resource_group" "ikigai_rg" {
  name     = var.resource_group_name
}

# Dcoumentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/aadb2c_directory
resource "azurerm_aadb2c_directory" "ikigai-b2c-tenant" {
  country_code            = var.active_directory_b2c_country_code
  data_residency_location = var.active_directory_b2c_data_residency_location
  display_name            = var.active_directory_b2c_display_name
  domain_name             = var.active_directory_b2c_domain_name
  resource_group_name     = data.azurerm_resource_group.ikigai_rg.name
  sku_name                = var.active_directory_b2c_sku
}

# Note: User flows and B2C endpoints cannot be created through terraform

# function app for email sending

resource "azurerm_storage_account" "ikigai-email-send-storage-account" {
  name                     = var.email_send_storage_account_name
  resource_group_name      = data.azurerm_resource_group.ikigai_rg.name
  location                 = data.azurerm_resource_group.ikigai_rg.location
  account_tier             = var.email_send_storage_account_tier
  account_replication_type = var.email_send_storage_account_replication_type
}

resource "azurerm_service_plan" "ikigai-service-plan" {
  name                = var.service_plan_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  os_type             = "Linux"
  sku_name            = var.service_plan_sku
}

resource "azurerm_linux_function_app" "ikigai-email-send" {
  name                       = var.function_app_name
  location                   = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name        = data.azurerm_resource_group.ikigai_rg.name
  service_plan_id            = azurerm_service_plan.ikigai-service-plan.id

  storage_account_name       = azurerm_storage_account.ikigai-email-send-storage-account.name
  storage_account_access_key = azurerm_storage_account.ikigai-email-send-storage-account.primary_access_key

  site_config {}
}

resource "azurerm_function_app_function" "email-send-trigger" {
  name            = var.function_app_function_name
  function_app_id = azurerm_linux_function_app.ikigai-email-send.id
  language        = "Python"

  file {
    name    = "function_app.py"
    content = file("${path.module}/email_send_ikigai/function_app.py")
  }

  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}

# azure communication for email infrastructure

resource "azurerm_email_communication_service" "ikigai-email-service" {
  name                = var.email_communication_service_name
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  data_location       = var.email_communication_service_data_location
}

# Note email domains are not supported in Terraform and must be created manually