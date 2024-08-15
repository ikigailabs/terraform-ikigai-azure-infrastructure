# Ikigai Azure PostgreSQL Server Terraform Module

This module deploys the Azure PostgreSQL Server infrastructure required for an Ikigai application setup.

## Usage

To use the PostgreSQL Server module, the id of an existing subnet dedicated to hosting database servers is needed as input. Pass it in using a data source that links to this subnet.

This is a simple example usage of the PostgreSQL Server module, only setting the required inputs:

```hcl
module "azure-infrastructure_rds" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/rds"
  version = "~>1.0"
  
  virtual_network_id = data.azurerm_virtual_network.ikigai_vnet.id
  database_subnet_id = data.azurerm_subnet.database_subnet.id
  airbyte_server_password = "REQUIRED_PASSWORD"
  airbyte_server_username = "REQUIRED_USERNAME"
  dashhub_server_password = "REQUIRED_PASSWORD"
  dashhub_server_username = "REQUIRED_USERNAME"
  database_storage_server_password = "REQUIRED_PASSWORD"
  database_storage_server_username = "REQUIRED_USERNAME"
  jupyterhub_server_password = "REQUIRED_PASSWORD"
  jupyterhub_server_username = "REQUIRED_USERNAME"
  pipeline_staging_server_password = "REQUIRED_PASSWORD"
  pipeline_staging_server_username = "REQUIRED_USERNAME"
  service_metadata_server_password = "REQUIRED_PASSWORD"
  service_metadata_server_username = "REQUIRED_USERNAME"
  superset_server_password = "REQUIRED_PASSWORD"
  superset_server_username = "REQUIRED_USERNAME"
}
```

The full list of inputs to customize the module deployment is shown below. To use them, add `[input name] = target_value` within the module braces.
For example, to set the `cosmosdb_account_name` input to `my_cosmosdb`, add `storage_account_name = "my_cosmosdb"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| virtual_network_id | ID of the virtual network linked to the postgres server instances | `string` | n/a | yes |
| database_subnet_id | ID of the database subnet linked to the postgres server instances | `string` | n/a | yes |
| airbyte_server_password | Password of the airbyte postgres server | `string` | n/a | yes |
| airbyte_server_username | Username of the airbyte postgres server | `string` | n/a | yes |
| dashhub_server_password | Password of the dashhub postgres server | `string` | n/a | yes |
| dashhub_server_username | Username of the dashhub postgres server | `string` | n/a | yes |
| database_storage_server_password | Password of the database_storage postgres server | `string` | n/a | yes |
| database_storage_server_username | Username of the database_storage postgres server | `string` | n/a | yes |
| jupyterhub_server_password | Password of the jupyterhub postgres server | `string` | n/a | yes |
| jupyterhub_server_username | Username of the jupyterhub postgres server | `string` | n/a | yes |
| pipeline_staging_server_password | Password of the pipeline_staging postgres server | `string` | n/a | yes |
| pipeline_staging_server_username | Username of the pipeline_staging postgres server | `string` | n/a | yes |
| service_metadata_server_password | Password of the service_metadata postgres server | `string` | n/a | yes |
| service_metadata_server_username | Username of the service_metadata postgres server |`string`  | n/a | yes |
| superset_server_password | Password of the superset postgres server | `string` | n/a | yes |
| superset_server_username | Username of the superset postgres server | `string` | n/a | yes |
| airbyte_database_charset | Charset of the database of the airbyte postgres server | `string` | `"utf8"` | no |
| airbyte_database_collation | Collation of the database of the airbyte postgres server | `string` | `"en_US.utf8"` | no |
| airbyte_database_name | Name of the database of the airbyte postgres server | `string` | `"airbyte-db"` | no |
| airbyte_server_dns_vnet_link_name | Name of the link between the airbyte dns zone and virtual network | `string` | `"airbyte_dns_vnet_link"` | no |
| airbyte_server_hostname | DNS hostname of the airbyte postgres server | `string` | `"airbyte.ikigai.postgres.database.azure.com"` | no |
| airbyte_server_name | Name of the airbyte postgres server | `string` | `"airbyte-ikigai"` | no |
| airbyte_server_postgres_version | Postgres version of the airbyte postgres server | `string` | `"12"` | no |
| airbyte_server_zone | Availability zone of the airbyte postgres server | `string` | `"1"` | no |
| airbyte_sku_name | Name of the SKU of the airbyte postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| airbyte_storage_capacity | Storage capacity of the airbyte postres server | `number` | `32768` | no |
| dashhub_database_charset | Charset of the database of the dashhub postgres server | `string` | `"utf8"` | no |
| dashhub_database_collation | Collation of the database of the dashhub postgres server | `string` | `"en_US.utf8"` | no |
| dashhub_database_name | Name of the database of the dashhub postgres server | `string` | `"dashhub-db"` | no |
| dashhub_server_dns_vnet_link_name | Name of the link between the dashhub dns zone and virtual network | `string` | `"dashhub_dns_vnet_link"` | no |
| dashhub_server_hostname | DNS hostname of the dashhub postgres server | `string` | `"dashhub.ikigai.postgres.database.azure.com"` | no |
| dashhub_server_name | Name of the dashhub postgres server | `string` | `"dashhub-ikigai"` | no |
| dashhub_server_postgres_version | Postgres version of the dashhub postgres server | `string` | `"12"` | no |
| dashhub_server_zone | Availability zone of the dashhub postgres server | `string` | `"1"` | no |
| dashhub_sku_name | Name of the SKU of the dashhub postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| dashhub_storage_capacity | Storage capacity of the dashhub postres server | `number` | `32768` | no |
| database_storage_database_charset | Charset of the database of the database_storage postgres server | `string` | `"utf8"` | no |
| database_storage_database_collation | Collation of the database of the database_storage postgres server | `string` | `"en_US.utf8"` | no |
| database_storage_database_name | Name of the database of the database_storage postgres server | `string` | `"database-storage-db"` | no |
| database_storage_server_dns_vnet_link_name | Name of the link between the database_storage dns zone and virtual network | `string` | `"database_storage_dns_vnet_link"` | no |
| database_storage_server_hostname | DNS hostname of the database_storage postgres server | `string` | `"databasestorage.ikigai.postgres.database.azure.com"` | no |
| database_storage_server_name | Name of the database_storage postgres server | `string` | `"database-storage-ikigai"` | no |
| database_storage_server_postgres_version | Postgres version of the database_storage postgres server | `string` | `"12"` | no |
| database_storage_server_zone | Availability zone of the database_storage postgres server | `string` | `"1"` | no |
| database_storage_sku_name | Name of the SKU of the database_storage postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| database_storage_storage_capacity | Storage capacity of the database_storage postres server | `number` | `32768` | no |
| jupyterhub_database_charset | Charset of the database of the jupyterhub postgres server | `string` | `"utf8"` | no |
| jupyterhub_database_collation | Collation of the database of the jupyterhub postgres server | `string` | `"en_US.utf8"` | no |
| jupyterhub_database_name | Name of the database of the jupyterhub postgres server | `string` | `"jupyterhub-db"` | no |
| jupyterhub_server_dns_vnet_link_name | Name of the link between the jupyterhub dns zone and virtual network | `string` | `"jupyterhub_dns_vnet_link"` | no |
| jupyterhub_server_hostname | DNS hostname of the jupyterhub postgres server | `string` | `"jupyterhub.ikigai.postgres.database.azure.com"` | no |
| jupyterhub_server_name | Name of the jupyterhub postgres server | `string` | `"jupyterhub-ikigai"` | no |
| jupyterhub_server_postgres_version | Postgres version of the jupyterhub postgres server | `string` | `"12"` | no |
| jupyterhub_server_zone | Availability zone of the jupyterhub postgres server | `string` | `"1"` | no |
| jupyterhub_sku_name | Name of the SKU of the jupyterhub postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| jupyterhub_storage_capacity | Storage capacity of the jupyterhub postres server | `number` | `32768` | no |
| pipeline_staging_database_charset | Charset of the database of the pipeline_staging postgres server | `string` | `"utf8"` | no |
| pipeline_staging_database_collation | Collation of the database of the pipeline_staging postgres server | `string` | `"en_US.utf8"` | no |
| pipeline_staging_database_name | Name of the database of the pipeline_staging postgres server | `string` | `"pipeline-staging-db"` | no |
| pipeline_staging_server_dns_vnet_link_name | Name of the link between the pipeline_staging dns zone and virtual network | `string` | `"pipeline_staging_dns_vnet_link"` | no |
| pipeline_staging_server_hostname | DNS hostname of the pipeline_staging postgres server | `string` | `"pipelinestaging.ikigai.postgres.database.azure.com"` | no |
| pipeline_staging_server_name | Name of the pipeline_staging postgres server | `string` | `"pipeline-staging-ikigai"` | no |
| pipeline_staging_server_postgres_version | Postgres version of the pipeline_staging postgres server | `string` | `"12"` | no |
| pipeline_staging_server_zone | Availability zone of the pipeline_staging postgres server | `string` | `"1"` | no |
| pipeline_staging_sku_name | Name of the SKU of the pipeline_staging postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| pipeline_staging_storage_capacity | Storage capacity of the pipeline_staging postres server | `number` | `32768` | no |
| resource_group_name | Name of the resource group the rds instances will be deployed into | `string` | `"ikigai-resource-group"` | no |
| service_metadata_database_charset | Charset of the database of the service_metadata postgres server | `string` | `"utf8"` | no |
| service_metadata_database_collation | Collation of the database of the service_metadata postgres server | `string` | `"en_US.utf8"` | no |
| service_metadata_database_name | Name of the database of the service_metadata postgres server | `string` | `"service-metadata-db"` | no |
| service_metadata_server_dns_vnet_link_name | Name of the link between the service_metadata dns zone and virtual network | `string` | `"service_metadata_dns_vnet_link"` | no |
| service_metadata_server_hostname | DNS hostname of the service_metadata postgres server | `string` | `"servicemetadata.ikigai.postgres.database.azure.com"` | no |
| service_metadata_server_name | Name of the service_metadata postgres server | `string` | `"service-metadata-ikigai"` | no |
| service_metadata_server_postgres_version | Postgres version of the service_metadata postgres server | `string` | `"12"` | no |
| service_metadata_server_zone | Availability zone of the service_metadata postgres server | `string` | `"1"` | no |
| service_metadata_sku_name | Name of the SKU of the service_metadata postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| service_metadata_storage_capacity | Storage capacity of the service_metadata postres server | `number` | `32768` | no |
| superset_database_charset | Charset of the database of the superset postgres server | `string` | `"utf8"` | no |
| superset_database_collation | Collation of the database of the superset postgres server | `string` | `"en_US.utf8"` | no |
| superset_database_name | Name of the database of the superset postgres server | `string` | `"superset-db"` | no |
| superset_server_dns_vnet_link_name | Name of the link between the superset dns zone and virtual network | `string` | `"superset_dns_vnet_link"` | no |
| superset_server_hostname | DNS hostname of the superset postgres server | `string` | `"superset.ikigai.postgres.database.azure.com"` | no |
| superset_server_name | Name of the superset postgres server | `string` | `"superset-ikigai"` | no |
| superset_server_postgres_version | Postgres version of the superset postgres server | `string` | `"12"` | no |
| superset_server_zone | Availability zone of the superset postgres server | `string` | `"1"` | no |
| superset_sku_name | Name of the SKU of the superset postgres server | `string` | `"GP_Standard_D4s_v3"` | no |
| superset_storage_capacity | Storage capacity of the superset postres server | `number` | `32768` | no |

## Outputs

There are no outputs for this module
