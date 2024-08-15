# Ikigai Azure CosmosDB Terraform Module

This module deploys the Azure CosmosDB infrastructure required for an Ikigai application setup.

## Usage

To use the CosmosDB module, the id of a private subnet is needed as input. Pass it in using a data source that links to this subnet.

This is a simple example usage of the CosmosDB module, only setting the required inputs:

```hcl
module "azure-infrastructure_cosmos_db" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/cosmos_db"
  version = "~>1.0"
  
  cosmosdb_replication_region = "REQUIRED_REPLICATION_REGION"
  private_subnet_id           = data.azurerm_subnet.private_subnet.id
}
```

The full list of inputs to customize the module deployment is shown below. To use them, add `[input name] = target_value` within the module braces.
For example, to set the `cosmosdb_account_name` input to `my_cosmosdb`, add `storage_account_name = "my_cosmosdb"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cosmosdb_replication_region | Name of the Azure region to host replicated data | `string` | n/a | yes |
| private_subnet_id | ID of the private subnet linked to the cosmos instances | `string` | n/a | yes |
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
