variable "resource_group_name" {
  description = "Name of the resource group the cosmos instances will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "private_subnet_id" {
  description = "ID of the private subnet linked to the storage instances"
  type        = string
}

variable "cosmosdb_account_name" {
  description = "Name of the Ikigai cosmosDB account"
  type        = string
  default     = "ikigai-cosmosdb"
}

variable "cosmosdb_consistency_level" {
  description = "Consistency policy of the Ikigai cosmosDB account"
  type        = string
  default     = "Eventual"
}

variable "cosmosdb_replication_region" {
  description = "Name of the Azure region to host replicated data"
  type        = string
}

variable "connections_table_name" {
  description = "Ikigai connections cosmosDB table name"
  type        = string
  default     = "connections-ikigai"
}

variable "facet_templates_table_name" {
  description = "Ikigai facet templates cosmosDB table name"
  type        = string
  default     = "facet-templates-ikigai"
}

variable "locks_table_name" {
  description = "Ikigai locks cosmosDB table name"
  type        = string
  default     = "lock-table-ikigai"
}

variable "pypr_locks_table_name" {
  description = "Ikigai pypr locks cosmosDB table name"
  type        = string
  default     = "pypr-locks-ikigai"
}

variable "remote_jobs_table_name" {
  description = "Ikigai remote jobs cosmosDB table name"
  type        = string
  default     = "remote-jobs-ikigai"
}