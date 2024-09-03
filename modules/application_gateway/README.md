# Ikigai Azure Application Gateway Terraform Module

This module deploys the Azure Application Gateway infrastructure required for an Ikigai application setup.

## Usage

To use the Application Gateway module, the id of an existing subnet dedicated to hosting application gateways is needed as input. Pass them in using a data source that links to this subnet.

This is a simple example usage of the Application Gateway module, only setting the required inputs:

```hcl
module "azure-infrastructure_aks" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/aks"
  version = "~> 1.0"
  
  application_gateway_subnet_id   = data.azurerm_subnet.app_gateway_subnet.id
  domain_cert_key_vault_id        = "REQUIRED_KEY_VAULT_ID"
  domain_cert_key_vault_name      = "REQUIRED_KEY_VAULT_NAME"
  domain_cert_resource_group_name = "REQUIRED_KEY_VAULT_RESOURCE_GROUP_NAME"
}
```

The full list of inputs to customize the module deployment is shown below. To use them, add `[input name] = target_value` within the module braces.
For example, to set the `frontend_gateway_name` input to `my_gateway`, add `frontend_gateway_name = "my_gateway"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application_gateway_subnet_id | ID of the subnet dedicated to hosting application gateways | `string` | n/a | yes |
| domain_cert_key_vault_id | Key vault secret ID for the Ikigai ssl certificate | `string` | n/a | yes |
| domain_cert_key_vault_name | Name of the key vault storing the Ikigai ssl certificate | `string` | n/a | yes |
| domain_cert_resource_group_name | Name of the resource group storing the Ikigai ssl certificate | `string` | n/a | yes |
| resource_group_name | Name of the resource group the application gateways will be deployed into | `string` | `"ikigai-resource-group"` | no |
| frontend_gateway_autoscale_max_capacity | Maximum autoscaling capacity of the frontend application gateway | `number` | `10` | no |
| frontend_gateway_autoscale_min_capacity |  Minimum autoscaling capacity of the frontend application gateway | `number` | `1` | no |
| frontend_gateway_contributor_role_name | Name of the role definition for Contributor to the frontend application gateway | `string` | `"frontend-app-gateway-contributor"` | no |
| frontend_gateway_identity_reader_role_name | Name of the role definition for reading the frontend application gateway identity | `string` | `"frontend-app-gateway-identity-operator"` | no |
| frontend_gateway_ip_reader_role_name | Name of the role definition to read the frontend application gateway public IP | `string` | `"frontend-public-ip-reader"` | no |
| frontend_gateway_managed_identity_name | Name of the managed identity for the frontend application gateway | `string` | `"frontend-app-gateway-managed-identity"` | no |
| frontend_gateway_name | Name of the frontend application gateway | `string` | `"ikigai-frontend-app-gateway"` | no | `"ikigai-frontend-app-gateway"` | no |
| frontend_gateway_public_ip_name | Name of the public IP for the frontend application gateway | `string` | `"frontend-public-ip"` | no |
| frontend_gateway_sku_name |  SKU name of the frontend application gateway | `string` | `"Standard_v2"` | no |
| frontend_gateway_sku_tier | SKU tier of the frontend application gateway | `string` | `"Standard_v2"` | no |
| ingress_gateway_autoscale_max_capacity | Maximum autoscaling capacity of the ingress application gateway | `number` | `10` | no |
| ingress_gateway_autoscale_min_capacity |  Minimum autoscaling capacity of the ingress application gateway | `number` | `1` | no |
| ingress_gateway_contributor_role_name | Name of the role definition for Contributor to the ingress application gateway | `string` | `"ingress-app-gateway-contributor"` | no |
| ingress_gateway_identity_reader_role_name | Name of the role definition for reading the ingress application gateway identity | `string` | `"ingress-app-gateway-identity-operator"` | no |
| ingress_gateway_ip_reader_role_name | Name of the role definition to read the ingress application gateway public IP | `string` | `"ingress-public-ip-reader"` | no |
| ingress_gateway_managed_identity_name | Name of the managed identity for the ingress application gateway | `string` | `"ingress-app-gateway-managed-identity"` | no |
| ingress_gateway_name | Name of the ingress application gateway | `string` | `"ikigai-ingress-app-gateway"` | no | `"ikigai-ingress-app-gateway"` | no |
| ingress_gateway_public_ip_name | Name of the public IP for the ingress application gateway | `string` | `"ingress-public-ip"` | no |
| ingress_gateway_sku_name |  SKU name of the ingress application gateway | `string` | `"Standard_v2"` | no |
| ingress_gateway_sku_tier | SKU tier of the ingress application gateway | `string` | `"Standard_v2"` | no |
| service_principal_name | Name of the service principal used to authenticate application gateways with kubernetes | `string` | `"ikigai-service-principal"` | no |

## Outputs

There are no outputs for this module
