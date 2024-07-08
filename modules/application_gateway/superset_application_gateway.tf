resource "azurerm_user_assigned_identity" "superset_app_gateway_managed_identity" {
  name                = var.superset_gateway_managed_identity_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_key_vault_access_policy" "superset_app_gateway_key_vault_policy" {
  key_vault_id = data.azurerm_key_vault.certificate_key_vault.id
  tenant_id    = azurerm_user_assigned_identity.superset_app_gateway_managed_identity.tenant_id
  object_id    = azurerm_user_assigned_identity.superset_app_gateway_managed_identity.principal_id

  secret_permissions = [
      "Get", "List"
  ]

  certificate_permissions = [
      "Get", "List"
  ]
}

resource "azurerm_public_ip" "superset_public_ip"  {
  name                = var.superset_gateway_public_ip_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

locals {
  superset_backend_address_pool_name = "${var.superset_gateway_name}-backend-address-pool"
  superset_port_name                 = "${var.superset_gateway_name}-port"
  superset_ip_configuration_name     = "${var.superset_gateway_name}-ip-configuration"
  superset_http_setting_name         = "${var.superset_gateway_name}-http-setting"
  superset_listener_name             = "${var.superset_gateway_name}-listener"
  superset_request_routing_rule_name = "${var.superset_gateway_name}-request-routing-rule"
  superset_ssl_certificate_name      = "${var.superset_gateway_name}-ssl-certificate"
}

resource "azurerm_application_gateway" "superset_application_gateway" {
  name                = var.superset_gateway_name
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
  location            = data.azurerm_resource_group.ikigai_rg.location
  enable_http2        = "true"

  sku {
    name = var.superset_gateway_sku_name
    tier = var.superset_gateway_sku_tier
  }

  autoscale_configuration {
    min_capacity = var.superset_gateway_autoscale_min_capacity
    max_capacity = var.superset_gateway_autoscale_max_capacity
  }

  gateway_ip_configuration {
    name      = local.superset_ip_configuration_name
    subnet_id = var.application_gateway_subnet_id
  }

  frontend_ip_configuration {
    name                 = local.superset_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.superset_public_ip.id
  }

  frontend_port {
    name = local.superset_port_name
    port = 80  
  }

  http_listener {
    name                           = local.superset_listener_name
    frontend_ip_configuration_name = local.superset_ip_configuration_name
    frontend_port_name             = local.superset_port_name
    protocol                       = "Http"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.superset_app_gateway_managed_identity.id]
  }

  ssl_certificate {
    name                = local.superset_ssl_certificate_name
    key_vault_secret_id = var.domain_cert_key_vault_id
  }

  backend_address_pool {
    name = local.superset_backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.superset_http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  request_routing_rule {
    name                       = local.superset_request_routing_rule_name
    priority                   = 1
    rule_type                  = "Basic"
    http_listener_name         = local.superset_listener_name
    backend_address_pool_name  = local.superset_backend_address_pool_name
    backend_http_settings_name = local.superset_http_setting_name
  }
}