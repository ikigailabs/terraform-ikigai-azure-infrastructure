# Ikigai Azure Active Directory B2C Terraform Module

This module deploys the Azure Active Directory B2C infrastructure required for an Ikigai application setup.

## Usage

This is a simple example usage of the Active Directory B2C module, with no optional inputs specified:

```hcl
module "azure-infrastructure_b2c" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/b2c"
  version = "~>1.0"
}
```

It is possible to further customize the deployment using the inputs listed below. To do so, add `[input name] = target_value` within the module braces.
For example, to set the `active_directory_b2c_display_name` input to `my_adb2c`, add `active_directory_b2c_display_name = "my_adb2c"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| active_directory_b2c_country_code | Country code for the Ikigai AD instance | `string` | `"US"` | no |
| active_directory_b2c_data_residency_location | Data residency location for the Ikigai AD instance | `string` | `"United States"` | no |
| active_directory_b2c_display_name | Display name for the Ikigai AD instance | `string` | `"ikigai-adb2c-tenant"` | no |
| active_directory_b2c_domain_name | Domain name for the Ikigai AD instance | `string` | `"ikigaiactivedirectory.onmicrosoft.com"` | no |
| active_directory_b2c_sku | SKU for the Ikigai AD instance | `string` | `"PremiumP1"` | no |
| email_communication_service_data_location | Data location of the Ikigai email service instance | `string` | `"United States"` | no |
| email_communication_service_name | Name of the Ikigai email service instance | `string` | `"ikigai-email-service"` | no |
| email_send_storage_account_name | Name of the storage account dedicated to email sending | `string` | `"ikigaiemail"` | no |
| email_send_storage_account_replication_type | Replication type of the storage account dedicated to email sending | `string` | `"ZRS"` | no |
| email_send_storage_account_tier | Tier of the storage account dedicated to email sending | `string` | `"Standard"` | no |
| function_app_function_name | Name of the Ikigai email-sending function within function app | `string` | `"email-send-function"` | no |
| function_app_name | Name of the Ikigai email-sending function app | `string` | `"ikigai-email-send"` | no |
| resource_group_name | Name of the resource group the B2C infrastructure will be deployed into |`string` | `"ikigai-resource-group"` | no |
| service_plan_name | Name of the ikigai service plan | `string` | `"azure-functions-ikigai-service-plan"` | no |
| service_plan_sku | SKU of the ikigai email-sending service plan | `string` | `"Y1"` | no |

## Outputs

There are no outputs for this module
