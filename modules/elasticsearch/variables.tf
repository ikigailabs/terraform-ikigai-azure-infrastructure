variable "resource_group_name" {
  description = "Name of the resource group the elasticsearch instances will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "component_logs_elasticsearch_name" {
  type        = string
  description = "Name of Ikigai component logs elasticsearch instance"
  default     = "component-logs-ikigai"
}

variable "monitor_elasticsearch_name" {
  type        = string
  description = "Name of Ikigai monitoring elasticsearch instance"
  default     = "monitor-ikigai"
}

variable "component_logs_elasticsearch_sku" {
  type        = string
  description = "SKU of Ikigai component logs elasticsearch instance"
  default     = "ess-consumption-2024_Monthly"
}

variable "monitor_elasticsearch_sku" {
  type        = string
  description = "SKU of Ikigai monitoring elasticsearch instance"
  default     = "ess-consumption-2024_Monthly"
}

variable "component_logs_elasticsearch_email" {
  type        = string
  description = "Email address for Ikigai component logs elasticsearch instance"
}

variable "monitor_elasticsearch_email" {
  type        = string
  description = "Email address for Ikigai monitoring elasticsearch instance"
}