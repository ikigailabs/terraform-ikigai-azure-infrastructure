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
| cosmosdb_replication_region | Name of the Azure region to host replicated data | `string` | n/a | yes |
| private_subnet_id | ID of the private subnet linked to the storage instances | `string` | n/a | yes |
| connections_table_name | Ikigai connections cosmosDB table name | `string` | `"connections-ikigai"` | no |
| cosmosdb_account_name | Name of the Ikigai cosmosDB account | `string` | `"ikigai-cosmosdb"` | no |
| cosmosdb_consistency_level | Consistency policy of the Ikigai cosmosDB account | `string` | `"Eventual"` | no |
| facet_templates_table_name | Ikigai facet templates cosmosDB table name | `string` | `"facet-templates-ikigai"` | no |
| locks_table_name | Ikigai locks cosmosDB table name | `string` | `"lock-table-ikigai"` | no |
| pypr_locks_table_name | Ikigai pypr locks cosmosDB table name | `string` | `"pypr-locks-ikigai"` | no |
| remote_jobs_table_name | Ikigai remote jobs cosmosDB table name | `string` | `"remote-jobs-ikigai"` | no |
| resource_group_name | Name of the resource group the cosmos instances will be deployed into | `string` | `"ikigai-resource-group"` | no |

## Outputs

There are no outputs for this module
