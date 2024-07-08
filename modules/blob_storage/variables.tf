variable "resource_group_name" {
  description = "Name of the resource group the storage instances will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "private_subnet_id" {
  description = "ID of the private subnet linked to the storage instances"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the ikigai blob storage account"
  type        = string
  default     = "ikigaistorage"
}

variable "storage_account_tier" {
  description = "Tier of the ikigai blob storage account"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Replication type of the ikigai blob storage account"
  type        = string
  default     = "ZRS"
}

variable "anyscale_logs_container_name" {
  description = "Name of the container for anyscale logs"
  type        = string
  default     = "ikigai-anyscale"
}

variable "cold_storage_container_name" {
  description = "Name of the container for cold storage"
  type        = string
  default     = "ikigai-cold-storage"
}

variable "connectors_container_name" {
  description = "Name of the container for connectors"
  type        = string
  default     = "ikigai-connectors"
}

variable "custom_facet_container_name" {
  description = "Name of the container for custom facet"
  type        = string
  default     = "ikigai-custom-facet"
}

variable "dataset_container_name" {
  description = "Name of the container for dataset storage"
  type        = string
  default     = "ikigai-datasets"
}

variable "models_container_name" {
  description = "Name of the container for ikigai models"
  type        = string
  default     = "ikigai-models"
}

variable "sample_dataset_container_name" {
  description = "Name of the container for sample dataset storage"
  type        = string
  default     = "ikigai-sample-datasets"
}

variable "temp_container_name" {
  description = "Name of the container for temp storage"
  type        = string
  default     = "ikigai-temp"
}