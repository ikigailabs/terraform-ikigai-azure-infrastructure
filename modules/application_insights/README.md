# Ikigai Azure Application Insights Terraform Module

This module deploys the Azure Application Insights infrastructure required for an Ikigai application setup.

## Usage

This is a simple example usage of the Application Gateway module, with no optional inputs specified:

```hcl
module "azure-infrastructure_application_insights" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/application_insights"
  version = "~>1.0"
}
```

It is possible to further customize the deployment using the inputs listed below. To do so, add `[input name] = target_value` within the module braces.
For example, to set the `application_insights_name` input to `my_insights`, add `application_insights_name = "my_insights"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application_insights_name | Name of the ikigai application insights instance | `string` | `"ikigai-insight"` | no |
| application_insights_type | Type of the ikigai application insights instance | `string` | `"web"` | no |
| log_analytics_workspace_name | Name of the ikigai log analytics workspace | `string` | `"ikigai-workspace"` | no |
| log_analytics_workspace_retention | Retention of the ikigai log analytics workspace in days | `number` | `30` | no |
| log_analytics_workspace_sku | SKU of the ikigai log analytics workspace | `string` | `"PerGB2018"` | no |
| resource_group_name | Name of the resource group the application insights instances will be deployed into | `string` | `"ikigai-resource-group"` | no |

## Outputs

There are no outputs for this module
