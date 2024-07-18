# Ikigai Azure Elasticsearch Terraform Module

This module deploys the Azure Elasticsearch infrastructure required for an Ikigai application setup.

## Usage

This is a simple example usage of the Elasticsearch module, only setting the required inputs:

```hcl
module "azure-infrastructure_blob_storage" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/blob_storage"
  version = "~>1.0"

  component_logs_elasticsearch_email = "REQUIRED_EMAIL"
  monitor_elasticsearch_email        = "REQUIRED_EMAIL"
}
```

The full list of inputs to customize the module deployment is shown below. To use them, add `[input name] = target_value` within the module braces.
For example, to set the `component_logs_elasticsearch_name` input to `my_elasticsearch`, add `component_logs_elasticsearch_name = "my_elasticsearch"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| component_logs_elasticsearch_email | Email address for Ikigai component logs elasticsearch instance | `string` | n/a | yes |
| monitor_elasticsearch_email | Email address for Ikigai monitoring elasticsearch instance | `string` | n/a | yes |
| component_logs_elasticsearch_name | Name of Ikigai component logs elasticsearch instance | `string` | `"component-logs-ikigai"` | no |
| component_logs_elasticsearch_sku | SKU of Ikigai component logs elasticsearch instance | `string` | `"ess-consumption-2024_Monthly"` | no |
| monitor_elasticsearch_name | Name of Ikigai monitoring elasticsearch instance | `string` | `"monitor-ikigai"` | no |
| monitor_elasticsearch_sku | SKU of Ikigai monitoring elasticsearch instance | `string` | `"ess-consumption-2024_Monthly"` | no |
| resource_group_name | Name of the resource group the elasticsearch instances will be deployed into | `string` | `"ikigai-resource-group"` | no |

## Outputs

There are no outputs for this module
