variable "resource_group_name" {
  description = "Name of the resource group the application gateways will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "service_principal_name" {
  description = "Name of the service principal used to authenticate application gateways with kubernetes"
  type        = string
  default     = "ikigai-service-principal"
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