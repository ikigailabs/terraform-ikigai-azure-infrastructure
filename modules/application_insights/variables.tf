variable "resource_group_name" {
  description = "Name of the resource group the application insights instances will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "log_analytics_workspace_name" {
  description = "Name of the ikigai log analytics workspace"
  type        = string
  default     = "ikigai-workspace"
}

variable "log_analytics_workspace_sku" {
  description = "SKU of the ikigai log analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "log_analytics_workspace_retention" {
  description = "Retention of the ikigai log analytics workspace in days"
  type        = number
  default     = 30
}

variable "application_insights_name" {
  description = "Name of the ikigai application insights instance"
  type        = string
  default     = "ikigai-insight"
}

variable "application_insights_type" {
  description = "Type of the ikigai application insights instance"
  type        = string
  default     = "web"
}