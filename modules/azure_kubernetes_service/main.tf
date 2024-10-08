terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "=1.14.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.113.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.6.2"
    }
    time = {
      source  = "hashicorp/time"
      version = "=0.9.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# Loading previous instances of the resource group
data "azurerm_resource_group" "ikigai_rg" {
  name     = var.resource_group_name
}

# Creating the ikigai cluster
resource "azurerm_kubernetes_cluster" "ikigai_cluster" {
  name                = var.kubernetes_cluster_name
  location            = data.azurerm_resource_group.ikigai_rg.location
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name

  dns_prefix = var.kubernetes_cluster_dns_prefix

  network_profile {
    network_plugin = var.kubernetes_cluster_network_plugin
    network_policy = var.kubernetes_cluster_network_policy
    load_balancer_sku  = "standard"
    outbound_type = "userAssignedNATGateway"

    dns_service_ip = var.kubernetes_cluster_dns_service_ip
    service_cidr = var.kubernetes_cluster_service_cidr
  }

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_node_count
    vm_size    = var.default_node_pool_vm_size
    enable_node_public_ip = true
    vnet_subnet_id = var.private_subnet_id
    node_labels = {
      role = "service"
    }
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  private_cluster_enabled = false

  service_principal  {
    client_id = var.kubernetes_cluster_client_id
    client_secret = var.kubernetes_cluster_client_secret
  }
}

# Creating the service Kubernetes node pool
resource "azurerm_kubernetes_cluster_node_pool" "service-node-pool" {
  name                  = var.service_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.ikigai_cluster.id
  vm_size               = var.service_node_pool_vm_size
  node_count            = var.service_node_pool_node_count
  vnet_subnet_id        = var.private_subnet_id
  enable_node_public_ip = false
  node_labels = {
      role = "service"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "pipeline-node-pool" {
  name                  = var.pipeline_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.ikigai_cluster.id
  vm_size               = var.pipeline_node_pool_vm_size
  node_count            = var.pipeline_node_pool_node_count
  vnet_subnet_id        = var.private_subnet_id
  enable_node_public_ip = false
  node_labels = {
      role = "pipeline"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "dremio-node-pool" {
  name                  = var.dremio_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.ikigai_cluster.id
  vm_size               = var.dremio_node_pool_vm_size
  node_count            = var.dremio_node_pool_node_count
  vnet_subnet_id        = var.private_subnet_id
  enable_node_public_ip = false
  node_labels = {
      role = "dremio"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "kuberay-node-pool" {
  name                  = var.kuberay_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.ikigai_cluster.id
  vm_size               = var.kuberay_node_pool_vm_size
  node_count            = var.kuberay_node_pool_node_count
  vnet_subnet_id        = var.private_subnet_id
  enable_node_public_ip = false
  node_labels = {
      role = "kuberay"
  }
}