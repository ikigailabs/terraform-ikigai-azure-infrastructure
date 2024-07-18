variable "resource_group_name" {
  description = "Name of the resource group the b2c infrastructure will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "active_directory_b2c_country_code" {
  description = "Country code for the Ikigai Active Directory instance"
  type        = string
  default     = "US"
}

variable "active_directory_b2c_data_residency_location" {
  description = "Data residency location for the Ikigai Active Directory instance"
  type        = string
  default     = "United States"
}

variable "active_directory_b2c_display_name" {
  description = "Display name for the Ikigai Active Directory instance"
  type        = string
  default     = "ikigai-b2c-tenant"
}

variable "active_directory_b2c_domain_name" {
  description = "Domain name for the Ikigai Active Directory instance"
  type        = string
  default     = "ikigaiactivedirectory.onmicrosoft.com"
}

variable "active_directory_b2c_sku" {
  description = "SKU for the Ikigai Active Directory instance"
  type        = string
  default     = "PremiumP1"
}

variable "email_send_storage_account_name" {
  description = "Name of the storage account dedicated to email sending"
  type        = string
  default     = "ikigaiemail"
}

variable "email_send_storage_account_tier" {
  description = "Tier of the storage account dedicated to email sending"
  type        = string
  default     = "Standard"
}

variable "email_send_storage_account_replication_type" {
  description = "Replication type of the storage account dedicated to email sending"
  type        = string
  default     = "ZRS"
}

variable "service_plan_name" {
  description = "Name of the Ikigai service plan"
  type        = string
  default     = "azure-functions-ikigai-service-plan"
}

variable "service_plan_sku" {
  description = "SKU of the Ikigai email-sending service plan"
  type        = string
  default     = "Y1"
}

variable "function_app_name" {
  description = "Name of the Ikigai email-sending function app"
  type        = string
  default     = "ikigai-email-send"
}

variable "function_app_function_name" {
  description = "Name of the Ikigai email-sending function within function app"
  type        = string
  default     = "email-send-function"
}

variable "email_communication_service_name" {
  description = "Name of the Ikigai email service instance"
  type        = string
  default     = "ikigai-email-service"
}

variable "email_communication_service_data_location" {
  description = "Data location of the Ikigai email service instance"
  type        = string
  default     = "United States"
}