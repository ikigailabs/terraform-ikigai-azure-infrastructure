variable "resource_group_name" {
  description = "Name of the resource group the aks instances will be deployed into"
  type        = string
  default     = "ikigai-resource-group"
}

variable "private_subnet_id" {
  description = "ID of the private subnet linked to the AKS instances"
  type        = string
}

variable "kubernetes_cluster_name" {
  description = "Name of the ikigai azure kubernetes cluster"
  type        = string
  default     = "ikigai-aks-cluster"
}

variable "kubernetes_cluster_dns_prefix" {
  description = "DNS prefix of the ikigai azure kubernetes cluster"
  type        = string
  default     = "ikigai"
}

variable "kubernetes_cluster_dns_service_ip" {
  description = "DNS service IP of the ikigai azure kubernetes cluster"
  type        = string
  default     = "10.1.0.10"
}

variable "kubernetes_cluster_network_plugin" {
  description = "Network plugin of the ikigai azure kubernetes cluster"
  type        = string
  default     = "azure"
}

variable "kubernetes_cluster_network_policy" {
  description = "Network policy of the ikigai azure kubernetes cluster"
  type        = string
  default     = "azure"
}

variable "kubernetes_cluster_service_cidr" {
  description = "Service CIDR of the azure kubernetes cluster"
  type        = string
  default     = "10.1.0.0/16"
}

variable "default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "default"
}

variable "default_node_pool_node_count" {
  description = "Node count of the default node pool"
  type        = number
  default     = 1
}

variable "default_node_pool_vm_size" {
  description = "VM size of the default node pool"
  type        = string
  default     = "standard_d2_v2"
}

variable "kubernetes_cluster_client_id" {
  description = "Client ID for the ikigai azure kubernetes cluster"
  type        = string
}

variable "kubernetes_cluster_client_secret" {
  description = "Client secret for the ikigai azure kubernetes cluster"
  type        = string
}

variable "service_node_pool_name" {
  description = "Name of the service node pool"
  type        = string
  default     = "service"
}

variable "service_node_pool_node_count" {
  description = "Node count of the service node pool"
  type        = number
  default     = 7
}

variable "service_node_pool_vm_size" {
  description = "VM size of the service node pool"
  type        = string
  default     = "standard_d4_v5"
}

variable "pipeline_node_pool_name" {
  description = "Name of the pipeline node pool"
  type        = string
  default     = "pipeline"
}

variable "pipeline_node_pool_node_count" {
  description = "Node count of the pipeline node pool"
  type        = number
  default     = 2
}

variable "pipeline_node_pool_vm_size" {
  description = "VM size of the pipeline node pool"
  type        = string
  default     = "standard_d4_v5"
}

variable "dremio_node_pool_name" {
  description = "Name of the pipeline node pool"
  type        = string
  default     = "dremio"
}

variable "dremio_node_pool_node_count" {
  description = "Node count of the pipeline node pool"
  type        = number
  default     = 3
}

variable "dremio_node_pool_vm_size" {
  description = "VM size of the pipeline node pool"
  type        = string
  default     = "standard_d4_v5"
}