variable "resource_group_name" {
  description = "Name of the resource group the application gateways will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "application_gateway_subnet_id" {
  description = "ID of the application gateway subnet"
  type        = string
}

variable "domain_cert_key_vault_name" {
  description = "Name of the key vault storing the ikigai ssl certificate"
  type        = string
  default     = "ikigai-certificates"
}

variable "domain_cert_key_vault_id" {
  description = "Key vault secret ID for the ikigai ssl certificate"
  type        = string
}

variable "dashhub_gateway_managed_identity_name" {
  description = "Name of the managed identity for the dashhub application gateway"
  type        = string
  default     = "dashhub-app-gateway-managed-identity"
}

variable "dashhub_gateway_public_ip_name" {
  description = "Name of the public IP for the dashhub application gateway"
  type        = string
  default     = "dashhub-public-ip"
}

variable "dashhub_gateway_name" {
  description = "Name of the dashhub application gateway"
  type        = string
  default     = "ikigai-dashhub-app-gateway"
}

variable "dashhub_gateway_sku_name" {
  description = "SKU name of the dashhub application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "dashhub_gateway_sku_tier" {
  description = "SKU tier of the dashhub application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "dashhub_gateway_autoscale_min_capacity" {
  description = "Minimum autoscaling capacity of the dashhub application gateway"
  type        = number
  default     = 1
}

variable "dashhub_gateway_autoscale_max_capacity" {
  description = "Maximum autoscaling capacity of the dashhub application gateway"
  type        = number
  default     = 10
}

variable "dashhub_gateway_ip_reader_role_name" {
  description = "Name of the role definition to read the dashhub application gateway public IP"
  type        = string
  default     = "dashhub-public-ip-reader"
}

variable "dashhub_gateway_contributor_role_name" {
  description = "Name of the role definition for contributor to the dashhub application gateway"
  type        = string
  default     = "dashhub-app-gateway-contributor"
}

variable "dashhub_gateway_identity_reader_role_name" {
  description = "Name of the role definition for to read the dashhub application gateway identity"
  type        = string
  default     = "dashhub-app-gateway-identity-operator"
}

variable "frontend_gateway_managed_identity_name" {
  description = "Name of the managed identity for the frontend application gateway"
  type        = string
  default     = "frontend-app-gateway-managed-identity"
}

variable "frontend_gateway_public_ip_name" {
  description = "Name of the public IP for the frontend application gateway"
  type        = string
  default     = "frontend-public-ip"
}

variable "frontend_gateway_name" {
  description = "Name of the frontend application gateway"
  type        = string
  default     = "ikigai-frontend-app-gateway"
}

variable "frontend_gateway_sku_name" {
  description = "SKU name of the frontend application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "frontend_gateway_sku_tier" {
  description = "SKU tier of the frontend application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "frontend_gateway_autoscale_min_capacity" {
  description = "Minimum autoscaling capacity of the frontend application gateway"
  type        = number
  default     = 1
}

variable "frontend_gateway_autoscale_max_capacity" {
  description = "Maximum autoscaling capacity of the frontend application gateway"
  type        = number
  default     = 10
}

variable "frontend_gateway_ip_reader_role_name" {
  description = "Name of the role definition to read the frontend application gateway public IP"
  type        = string
  default     = "frontend-public-ip-reader"
}

variable "frontend_gateway_contributor_role_name" {
  description = "Name of the role definition for contributor to the frontend application gateway"
  type        = string
  default     = "frontend-app-gateway-contributor"
}

variable "frontend_gateway_identity_reader_role_name" {
  description = "Name of the role definition for to read the frontend application gateway identity"
  type        = string
  default     = "frontend-app-gateway-identity-operator"
}

variable "ingress_gateway_managed_identity_name" {
  description = "Name of the managed identity for the ingress application gateway"
  type        = string
  default     = "ingress-app-gateway-managed-identity"
}

variable "ingress_gateway_public_ip_name" {
  description = "Name of the public IP for the ingress application gateway"
  type        = string
  default     = "ingress-public-ip"
}

variable "ingress_gateway_name" {
  description = "Name of the ingress application gateway"
  type        = string
  default     = "ikigai-ingress-app-gateway"
}

variable "ingress_gateway_sku_name" {
  description = "SKU name of the ingress application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "ingress_gateway_sku_tier" {
  description = "SKU tier of the ingress application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "ingress_gateway_autoscale_min_capacity" {
  description = "Minimum autoscaling capacity of the ingress application gateway"
  type        = number
  default     = 1
}

variable "ingress_gateway_autoscale_max_capacity" {
  description = "Maximum autoscaling capacity of the ingress application gateway"
  type        = number
  default     = 10
}

variable "ingress_gateway_ip_reader_role_name" {
  description = "Name of the role definition to read the ingress application gateway public IP"
  type        = string
  default     = "ingress-public-ip-reader"
}

variable "ingress_gateway_contributor_role_name" {
  description = "Name of the role definition for contributor to the ingress application gateway"
  type        = string
  default     = "ingress-app-gateway-contributor"
}

variable "ingress_gateway_identity_reader_role_name" {
  description = "Name of the role definition for to read the ingress application gateway identity"
  type        = string
  default     = "ingress-app-gateway-identity-operator"
}

variable "jupyterhub_gateway_managed_identity_name" {
  description = "Name of the managed identity for the jupyterhub application gateway"
  type        = string
  default     = "jupyterhub-app-gateway-managed-identity"
}

variable "jupyterhub_gateway_public_ip_name" {
  description = "Name of the public IP for the jupyterhub application gateway"
  type        = string
  default     = "jupyterhub-public-ip"
}

variable "jupyterhub_gateway_name" {
  description = "Name of the jupyterhub application gateway"
  type        = string
  default     = "ikigai-jupyterhub-app-gateway"
}

variable "jupyterhub_gateway_sku_name" {
  description = "SKU name of the jupyterhub application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "jupyterhub_gateway_sku_tier" {
  description = "SKU tier of the jupyterhub application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "jupyterhub_gateway_autoscale_min_capacity" {
  description = "Minimum autoscaling capacity of the jupyterhub application gateway"
  type        = number
  default     = 1
}

variable "jupyterhub_gateway_autoscale_max_capacity" {
  description = "Maximum autoscaling capacity of the jupyterhub application gateway"
  type        = number
  default     = 10
}

variable "jupyterhub_gateway_ip_reader_role_name" {
  description = "Name of the role definition to read the jupyterhub application gateway public IP"
  type        = string
  default     = "jupyterhub-public-ip-reader"
}

variable "jupyterhub_gateway_contributor_role_name" {
  description = "Name of the role definition for contributor to the jupyterhub application gateway"
  type        = string
  default     = "jupyterhub-app-gateway-contributor"
}

variable "jupyterhub_gateway_identity_reader_role_name" {
  description = "Name of the role definition for to read the jupyterhub application gateway identity"
  type        = string
  default     = "jupyterhub-app-gateway-identity-operator"
}

variable "pypi_gateway_managed_identity_name" {
  description = "Name of the managed identity for the pypi application gateway"
  type        = string
  default     = "pypi-app-gateway-managed-identity"
}

variable "pypi_gateway_public_ip_name" {
  description = "Name of the public IP for the pypi application gateway"
  type        = string
  default     = "pypi-public-ip"
}

variable "pypi_gateway_name" {
  description = "Name of the pypi application gateway"
  type        = string
  default     = "ikigai-pypi-app-gateway"
}

variable "pypi_gateway_sku_name" {
  description = "SKU name of the pypi application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "pypi_gateway_sku_tier" {
  description = "SKU tier of the pypi application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "pypi_gateway_autoscale_min_capacity" {
  description = "Minimum autoscaling capacity of the pypi application gateway"
  type        = number
  default     = 1
}

variable "pypi_gateway_autoscale_max_capacity" {
  description = "Maximum autoscaling capacity of the pypi application gateway"
  type        = number
  default     = 10
}

variable "pypi_gateway_ip_reader_role_name" {
  description = "Name of the role definition to read the pypi application gateway public IP"
  type        = string
  default     = "pypi-public-ip-reader"
}

variable "pypi_gateway_contributor_role_name" {
  description = "Name of the role definition for contributor to the pypi application gateway"
  type        = string
  default     = "pypi-app-gateway-contributor"
}

variable "pypi_gateway_identity_reader_role_name" {
  description = "Name of the role definition for to read the pypi application gateway identity"
  type        = string
  default     = "pypi-app-gateway-identity-operator"
}

variable "superset_gateway_managed_identity_name" {
  description = "Name of the managed identity for the superset application gateway"
  type        = string
  default     = "superset-app-gateway-managed-identity"
}

variable "superset_gateway_public_ip_name" {
  description = "Name of the public IP for the superset application gateway"
  type        = string
  default     = "superset-public-ip"
}

variable "superset_gateway_name" {
  description = "Name of the superset application gateway"
  type        = string
  default     = "ikigai-superset-app-gateway"
}

variable "superset_gateway_sku_name" {
  description = "SKU name of the superset application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "superset_gateway_sku_tier" {
  description = "SKU tier of the superset application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "superset_gateway_autoscale_min_capacity" {
  description = "Minimum autoscaling capacity of the superset application gateway"
  type        = number
  default     = 1
}

variable "superset_gateway_autoscale_max_capacity" {
  description = "Maximum autoscaling capacity of the superset application gateway"
  type        = number
  default     = 10
}

variable "superset_gateway_ip_reader_role_name" {
  description = "Name of the role definition to read the superset application gateway public IP"
  type        = string
  default     = "superset-public-ip-reader"
}

variable "superset_gateway_contributor_role_name" {
  description = "Name of the role definition for contributor to the superset application gateway"
  type        = string
  default     = "superset-app-gateway-contributor"
}

variable "superset_gateway_identity_reader_role_name" {
  description = "Name of the role definition for to read the superset application gateway identity"
  type        = string
  default     = "superset-app-gateway-identity-operator"
}