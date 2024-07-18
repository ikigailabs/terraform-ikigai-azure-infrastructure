variable "resource_group_name" {
  description = "Name of the resource group the rds instances will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "virtual_network_id" {
  description = "ID of the virtual network linked to the postgres server instances"
  type        = string
}

variable "database_subnet_id" {
  description = "ID of the database subnet linked to the postgres server instances"
  type        = string
}

variable "airbyte_server_hostname" {
  description = "DNS hostname of the airbyte postgres server"
  type        = string
  default     = "airbyte.development.postgres.database.azure.com"
}

variable "airbyte_server_dns_vnet_link_name" {
  description = "Name of the link between the airbyte dns zone and virtual network"
  type        = string
  default     = "airbyte_dns_vnet_link"
}

variable "airbyte_server_name" {
  description = "Name of the airbyte postgres server"
  type        = string
  default     = "airbyte-ikigai"
}

variable "airbyte_server_postgres_version" {
  description = "Postgres version of the airbyte postgres server"
  type        = string
  default     = "12"
}

variable "airbyte_server_username" {
  description = "Username of the airbyte postgres server"
  type        = string
}

variable "airbyte_server_password" {
  description = "Password of the airbyte postgres server"
  type        = string
}

variable "airbyte_server_zone" {
  description = "Availability zone of the airbyte postgres server"
  type        = string
  default     = "1"
}

variable "airbyte_storage_capacity" {
  description = "Storage capacity of the airbyte postres server"
  type        = number
  default     = 32768
}

variable "airbyte_sku_name" {
  description = "Name of the SKU of the airbyte postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "airbyte_database_name" {
  description = "Name of the database of the airbyte postgres server"
  type        = string
  default     = "airbyte-db"
}

variable "airbyte_database_charset" {
  description = "Charset of the database of the airbyte postgres server"
  type        = string
  default     = "utf8"
}

variable "airbyte_database_collation" {
  description = "Collation of the database of the airbyte postgres server"
  type        = string
  default     = "en_US.utf8"
}

variable "dashhub_server_hostname" {
  description = "DNS hostname of the dashhub postgres server"
  type        = string
  default     = "dashhub.development.postgres.database.azure.com"
}

variable "dashhub_server_dns_vnet_link_name" {
  description = "Name of the link between the dashhub dns zone and virtual network"
  type        = string
  default     = "dashhub_dns_vnet_link"
}

variable "dashhub_server_name" {
  description = "Name of the dashhub postgres server"
  type        = string
  default     = "dashhub-ikigai"
}

variable "dashhub_server_postgres_version" {
  description = "Postgres version of the dashhub postgres server"
  type        = string
  default     = "12"
}

variable "dashhub_server_username" {
  description = "Username of the dashhub postgres server"
  type        = string
}

variable "dashhub_server_password" {
  description = "Password of the dashhub postgres server"
  type        = string
}

variable "dashhub_server_zone" {
  description = "Availability zone of the dashhub postgres server"
  type        = string
  default     = "1"
}

variable "dashhub_storage_capacity" {
  description = "Storage capacity of the dashhub postres server"
  type        = number
  default     = 32768
}

variable "dashhub_sku_name" {
  description = "Name of the SKU of the dashhub postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "dashhub_database_name" {
  description = "Name of the database of the dashhub postgres server"
  type        = string
  default     = "dashhub-db"
}

variable "dashhub_database_charset" {
  description = "Charset of the database of the dashhub postgres server"
  type        = string
  default     = "utf8"
}

variable "dashhub_database_collation" {
  description = "Collation of the database of the dashhub postgres server"
  type        = string
  default     = "en_US.utf8"
}

variable "database_storage_server_hostname" {
  description = "DNS hostname of the database_storage postgres server"
  type        = string
  default     = "databasestorage.development.postgres.database.azure.com"
}

variable "database_storage_server_dns_vnet_link_name" {
  description = "Name of the link between the database_storage dns zone and virtual network"
  type        = string
  default     = "database_storage_dns_vnet_link"
}

variable "database_storage_server_name" {
  description = "Name of the database_storage postgres server"
  type        = string
  default     = "database-storage-ikigai"
}

variable "database_storage_server_postgres_version" {
  description = "Postgres version of the database_storage postgres server"
  type        = string
  default     = "12"
}

variable "database_storage_server_username" {
  description = "Username of the database_storage postgres server"
  type        = string
}

variable "database_storage_server_password" {
  description = "Password of the database_storage postgres server"
  type        = string
}

variable "database_storage_server_zone" {
  description = "Availability zone of the database_storage postgres server"
  type        = string
  default     = "1"
}

variable "database_storage_storage_capacity" {
  description = "Storage capacity of the database_storage postres server"
  type        = number
  default     = 32768
}

variable "database_storage_sku_name" {
  description = "Name of the SKU of the database_storage postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "database_storage_database_name" {
  description = "Name of the database of the database_storage postgres server"
  type        = string
  default     = "database-storage-db"
}

variable "database_storage_database_charset" {
  description = "Charset of the database of the database_storage postgres server"
  type        = string
  default     = "utf8"
}

variable "database_storage_database_collation" {
  description = "Collation of the database of the database_storage postgres server"
  type        = string
  default     = "en_US.utf8"
}

variable "jupyterhub_server_hostname" {
  description = "DNS hostname of the jupyterhub postgres server"
  type        = string
  default     = "jupyterhub.development.postgres.database.azure.com"
}

variable "jupyterhub_server_dns_vnet_link_name" {
  description = "Name of the link between the jupyterhub dns zone and virtual network"
  type        = string
  default     = "jupyterhub_dns_vnet_link"
}

variable "jupyterhub_server_name" {
  description = "Name of the jupyterhub postgres server"
  type        = string
  default     = "jupyterhub-ikigai"
}

variable "jupyterhub_server_postgres_version" {
  description = "Postgres version of the jupyterhub postgres server"
  type        = string
  default     = "12"
}

variable "jupyterhub_server_username" {
  description = "Username of the jupyterhub postgres server"
  type        = string
}

variable "jupyterhub_server_password" {
  description = "Password of the jupyterhub postgres server"
  type        = string
}

variable "jupyterhub_server_zone" {
  description = "Availability zone of the jupyterhub postgres server"
  type        = string
  default     = "1"
}

variable "jupyterhub_storage_capacity" {
  description = "Storage capacity of the jupyterhub postres server"
  type        = number
  default     = 32768
}

variable "jupyterhub_sku_name" {
  description = "Name of the SKU of the jupyterhub postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "jupyterhub_database_name" {
  description = "Name of the database of the jupyterhub postgres server"
  type        = string
  default     = "jupyterhub-db"
}

variable "jupyterhub_database_charset" {
  description = "Charset of the database of the jupyterhub postgres server"
  type        = string
  default     = "utf8"
}

variable "jupyterhub_database_collation" {
  description = "Collation of the database of the jupyterhub postgres server"
  type        = string
  default     = "en_US.utf8"
}

variable "pipeline_staging_server_hostname" {
  description = "DNS hostname of the pipeline_staging postgres server"
  type        = string
  default     = "pipelinestaging.development.postgres.database.azure.com"
}

variable "pipeline_staging_server_dns_vnet_link_name" {
  description = "Name of the link between the pipeline_staging dns zone and virtual network"
  type        = string
  default     = "pipeline_staging_dns_vnet_link"
}

variable "pipeline_staging_server_name" {
  description = "Name of the pipeline_staging postgres server"
  type        = string
  default     = "database-storage-ikigai"
}

variable "pipeline_staging_server_postgres_version" {
  description = "Postgres version of the pipeline_staging postgres server"
  type        = string
  default     = "12"
}

variable "pipeline_staging_server_username" {
  description = "Username of the pipeline_staging postgres server"
  type        = string
}

variable "pipeline_staging_server_password" {
  description = "Password of the pipeline_staging postgres server"
  type        = string
}

variable "pipeline_staging_server_zone" {
  description = "Availability zone of the pipeline_staging postgres server"
  type        = string
  default     = "1"
}

variable "pipeline_staging_storage_capacity" {
  description = "Storage capacity of the pipeline_staging postres server"
  type        = number
  default     = 32768
}

variable "pipeline_staging_sku_name" {
  description = "Name of the SKU of the pipeline_staging postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "pipeline_staging_database_name" {
  description = "Name of the database of the pipeline_staging postgres server"
  type        = string
  default     = "database-storage-db"
}

variable "pipeline_staging_database_charset" {
  description = "Charset of the database of the pipeline_staging postgres server"
  type        = string
  default     = "utf8"
}

variable "pipeline_staging_database_collation" {
  description = "Collation of the database of the pipeline_staging postgres server"
  type        = string
  default     = "en_US.utf8"
}

variable "service_metadata_server_hostname" {
  description = "DNS hostname of the service_metadata postgres server"
  type        = string
  default     = "servicemetadata.development.postgres.database.azure.com"
}

variable "service_metadata_server_dns_vnet_link_name" {
  description = "Name of the link between the service_metadata dns zone and virtual network"
  type        = string
  default     = "service_metadata_dns_vnet_link"
}

variable "service_metadata_server_name" {
  description = "Name of the service_metadata postgres server"
  type        = string
  default     = "database-storage-ikigai"
}

variable "service_metadata_server_postgres_version" {
  description = "Postgres version of the service_metadata postgres server"
  type        = string
  default     = "12"
}

variable "service_metadata_server_username" {
  description = "Username of the service_metadata postgres server"
  type        = string
}

variable "service_metadata_server_password" {
  description = "Password of the service_metadata postgres server"
  type        = string
}

variable "service_metadata_server_zone" {
  description = "Availability zone of the service_metadata postgres server"
  type        = string
  default     = "1"
}

variable "service_metadata_storage_capacity" {
  description = "Storage capacity of the service_metadata postres server"
  type        = number
  default     = 32768
}

variable "service_metadata_sku_name" {
  description = "Name of the SKU of the service_metadata postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "service_metadata_database_name" {
  description = "Name of the database of the service_metadata postgres server"
  type        = string
  default     = "database-storage-db"
}

variable "service_metadata_database_charset" {
  description = "Charset of the database of the service_metadata postgres server"
  type        = string
  default     = "utf8"
}

variable "service_metadata_database_collation" {
  description = "Collation of the database of the service_metadata postgres server"
  type        = string
  default     = "en_US.utf8"
}

variable "superset_server_hostname" {
  description = "DNS hostname of the superset postgres server"
  type        = string
  default     = "superset.development.postgres.database.azure.com"
}

variable "superset_server_dns_vnet_link_name" {
  description = "Name of the link between the superset dns zone and virtual network"
  type        = string
  default     = "superset_dns_vnet_link"
}

variable "superset_server_name" {
  description = "Name of the superset postgres server"
  type        = string
  default     = "superset-ikigai"
}

variable "superset_server_postgres_version" {
  description = "Postgres version of the superset postgres server"
  type        = string
  default     = "12"
}

variable "superset_server_username" {
  description = "Username of the superset postgres server"
  type        = string
}

variable "superset_server_password" {
  description = "Password of the superset postgres server"
  type        = string
}

variable "superset_server_zone" {
  description = "Availability zone of the superset postgres server"
  type        = string
  default     = "1"
}

variable "superset_storage_capacity" {
  description = "Storage capacity of the superset postres server"
  type        = number
  default     = 32768
}

variable "superset_sku_name" {
  description = "Name of the SKU of the superset postgres server"
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "superset_database_name" {
  description = "Name of the database of the superset postgres server"
  type        = string
  default     = "superset-db"
}

variable "superset_database_charset" {
  description = "Charset of the database of the superset postgres server"
  type        = string
  default     = "utf8"
}

variable "superset_database_collation" {
  description = "Collation of the database of the superset postgres server"
  type        = string
  default     = "en_US.utf8"
}