# Ikigai Azure Kubernetes Service Terraform Module

This module deploys the Azure Kubernetes Service infrastructure required for an Ikigai application setup.

## Usage

To use the AKS module, the id of a private subnet is needed as input. Pass it in using a data source that links to this subnet.

This is a simple example usage of the AKS module, only setting the required inputs:

```hcl
module "azure-infrastructure_aks" {
  source  = "ikigailabs/azure-infrastructure/ikigai//modules/aks"
  version = "~> 1.0"
  
  private_subnet_id                = data.azurerm_subnet.private_subnet.id
  kubernetes_cluster_client_id     = "REQUIRED_SERVICE_PRINCIPAL_CLIENT_ID"
  kubernetes_cluster_client_secret = "REQUIRED_SERVICE_PRINCIPAL_CLIENT_SECRET"
}
```

The full list of inputs to customize the module deployment is shown below. To use them, add `[input name] = target_value` within the module braces.
For example, to set the `kubernetes_cluster_name` input to `my-cluster`, add `kubernetes_cluster_name = "my-cluster"` to the module block. Remember to add double quotes for string inputs! 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| kubernetes_cluster_client_id | Service Principal client ID for the ikigai azure kubernetes cluster | `string` | n/a | yes |
| kubernetes_cluster_client_secret | Service Principal client secret for the ikigai azure kubernetes cluster | `string` | n/a | yes |
| private_subnet_id | ID of the private subnet linked to the storage instances | `string` | n/a | yes |
| default_node_pool_name | Name of the default node pool in the cluster | `string` | `"default"` | no |
| default_node_pool_node_count | Node count of the default node pool in the cluster | `number` | `1` | no |
| default_node_pool_vm_size | VM size of the default node pool | `string` | `"standard_d2_v2"` | no |
| dremio_node_pool_name |  Name of the dremio node pool | `string` | `"dremio"` | no |
| dremio_node_pool_node_count | Node count of the dremio node pool | `number` | `3` | no |
| dremio_node_pool_vm_size | VM size of the dremio node pool | `string` | `"standard_e20s_v3"` | no |
| kuberay_node_pool_name |  Name of the kuberay node pool | `string` | `"kuberay"` | no |
| kuberay_node_pool_node_count | Node count of the kuberay node pool | `number` | `2` | no |
| kuberay_node_pool_vm_size | VM size of the kuberay node pool | `string` | `"standard_e16_v3"` | no |
| kubernetes_cluster_dns_prefix | DNS prefix of the ikigai azure kubernetes cluster | `string` | `"ikigai"` | no |
| kubernetes_cluster_dns_service_ip | DNS service IP of the ikigai azure kubernetes cluster | `string` | `"10.1.0.10"` | no |
| kubernetes_cluster_name | Name of the ikigai azure kubernetes cluster | `string` | `"ikigai-aks-cluster"` | no |
| kubernetes_cluster_network_plugin | Network plugin of the ikigai azure kubernetes cluster | `string` | `"azure"` | no |
| kubernetes_cluster_network_policy | Network policy of the ikigai azure kubernetes cluster | `string` | `"azure"` | no |
| kubernetes_cluster_service_cidr | Service CIDR of the azure kubernetes cluster | `string` | `"10.1.0.0/16"` | no |
| pipeline_node_pool_name |  Name of the pipeline node pool | `string` | `"pipeline"` | no |
| pipeline_node_pool_node_count | Node count of the pipeline node pool | `number` | `2` | no |
| pipeline_node_pool_vm_size | VM size of the pipeline node pool | `string` | `"standard_d4_v5"` | no |
| resource_group_name | Name of the resource group the aks instances will be deployed into | `string` | `"ikigai-resource-group"` | no |
| service_node_pool_name | Name of the service node pool | `string` | `"service"` | no |
| service_node_pool_node_count | Node count of the service node pool | `number` | `7` | no |
| service_node_pool_vm_size | VM size of the service node pool | `string` | `"standard_d4_v5"` | no |

## Outputs

There are no outputs for this module
