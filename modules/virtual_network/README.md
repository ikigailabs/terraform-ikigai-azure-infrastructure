# Ikigai Azure Virtual Network Service Terraform Module

This module deploys the Virtual Network infrastructure required for an Ikigai application setup.

## Usage

This is a simple example usage of the Virtual Network module, only setting the required inputs:

```hcl
module "azure-infrastructure_vpc" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/vpc"
  version = "~> 1.0"
}
```

The full list of inputs to customize the module deployment is shown below. To use them, add `[input name] = target_value` within the module braces.
For example, to set the `kubernetes_cluster_name` input to `my-cluster`, add `kubernetes_cluster_name = "my-cluster"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application_gateway_subnet_address_prefix | Address prefix of the application gateway subnet | `string` | `"10.0.4.0/24"` | no |
| application_gateway_subnet_name | Name of the application gateway subnet | `string` | `"application-gateway-subnet"` | no |
| database_subnet_address_prefix | Address prefix of the database subnet | `string` | `"10.0.3.0/24"` | no |
| database_subnet_name | Name of the database subnet | `string` | `"database-subnet"` | no |
| nat_gateway_name | Name of the ikigai NAT gateway | `string` | `"ikigai-NAT-gateway"` | no |
| nat_gateway_public_ip_name | Name of the public IP associated with the NAT gateway | `string` | `"ikigai-NAT-Gateway-Public-IP"` | no |
| private_subnet_address_prefix | Address prefix of the private subnet | `string` | `"10.0.32.0/19"` | no |
| private_subnet_name | Name of the private subnet | `string` | `"private-subnet"` | no |
| resource_group_name | Name of the resource group to be created | `string` | `"ikigai-resource-group"` | no |
| route_table_name | Name of the route table for internet gateway access | `"ikigai-route-table"` | `string` | no |
| security_group_name | Name of the security group for the ikigai virtual network | `string` | `"ikigai-security-group"` | no |
| virtual_network_address_space | Address space of the ikigai virtual network | `string` | `"10.0.0.0/16"` | no |
| virtual_network_name | Name of the ikigai virtual network | `string` | `"ikigai-virtual-network"` | no |

## Outputs

There are no outputs for this module
