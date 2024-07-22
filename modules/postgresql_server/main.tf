terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.113.0"
    }
  }
}

provider "azurerm" {
  features {}
}
# Documentation link :https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server

# Loading previous instances of the resource gropu and subnet created by VPC
data "azurerm_resource_group" "ikigai_rg" {
  name = var.resource_group_name
}

# Launching airbyte SQL development server
resource "azurerm_private_dns_zone" "database-dns-airbyte" {
  name                = var.airbyte_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-airbyte" {
  name                  = var.airbyte_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-airbyte.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "airbyte-postgresql-server" {
  name                   = var.airbyte_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.airbyte_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.airbyte_server_username
  administrator_password = var.airbyte_server_password
  zone                   = var.airbyte_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-airbyte.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.airbyte_storage_capacity

  sku_name   = var.airbyte_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-airbyte]
}

resource "azurerm_postgresql_flexible_server_database" "airbyte" {
  name      = var.airbyte_database_name
  server_id = azurerm_postgresql_flexible_server.airbyte-postgresql-server.id
  charset   = var.airbyte_database_charset
  collation = var.airbyte_database_collation
}


# Launching dashhub SQL development server
resource "azurerm_private_dns_zone" "database-dns-dashhub" {
  name                = var.dashhub_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-dashhub" {
  name                  = var.dashhub_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-dashhub.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "dashhub-postgresql-server" {
  name                   = var.dashhub_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.dashhub_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.dashhub_server_username
  administrator_password = var.dashhub_server_password
  zone                   = var.dashhub_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-dashhub.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.dashhub_storage_capacity

  sku_name   = var.dashhub_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-dashhub]
}

resource "azurerm_postgresql_flexible_server_database" "dashhub" {
  name      = var.dashhub_database_name
  server_id = azurerm_postgresql_flexible_server.dashhub-postgresql-server.id
  charset   = var.dashhub_database_charset
  collation = var.dashhub_database_collation
}


# Launching database-storage SQL development server
resource "azurerm_private_dns_zone" "database-dns-database-storage" {
  name                = var.database_storage_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-database-storage" {
  name                  = var.database_storage_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-database-storage.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "database-storage-postgresql-server" {
  name                   = var.database_storage_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.database_storage_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.database_storage_server_username
  administrator_password = var.database_storage_server_password
  zone                   = var.database_storage_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-database-storage.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.database_storage_storage_capacity

  sku_name   = var.database_storage_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-database-storage]
}

resource "azurerm_postgresql_flexible_server_database" "database-storage" {
  name      = var.database_storage_database_name

  server_id = azurerm_postgresql_flexible_server.database-storage-postgresql-server.id
  charset   = var.database_storage_database_charset
  collation = var.database_storage_database_collation
}


# Launching jupyterhub SQL development server
resource "azurerm_private_dns_zone" "database-dns-jupyterhub" {
  name                = var.jupyterhub_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-jupyterhub" {
  name                  = var.jupyterhub_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-jupyterhub.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "jupyterhub-postgresql-server" {
  name                   = var.jupyterhub_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.jupyterhub_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.jupyterhub_server_username
  administrator_password = var.jupyterhub_server_password
  zone                   = var.jupyterhub_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-jupyterhub.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.jupyterhub_storage_capacity

  sku_name   = var.jupyterhub_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-jupyterhub]
}

resource "azurerm_postgresql_flexible_server_database" "jupyterhub" {
  name      = var.jupyterhub_database_name

  server_id = azurerm_postgresql_flexible_server.jupyterhub-postgresql-server.id
  charset   = var.jupyterhub_database_charset
  collation = var.jupyterhub_database_collation
}


# Launching pipeline-staging SQL development server
resource "azurerm_private_dns_zone" "database-dns-pipeline-staging" {
  name                = var.pipeline_staging_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-pipeline-staging" {
  name                  = var.pipeline_staging_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-pipeline-staging.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "pipeline-staging-postgresql-server" {
  name                   = var.pipeline_staging_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.pipeline_staging_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.pipeline_staging_server_username
  administrator_password = var.pipeline_staging_server_password
  zone                   = var.pipeline_staging_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-pipeline-staging.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.pipeline_staging_storage_capacity

  sku_name   = var.pipeline_staging_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-pipeline-staging]
}

resource "azurerm_postgresql_flexible_server_database" "pipeline-staging" {
  name      = var.pipeline_staging_database_name

  server_id = azurerm_postgresql_flexible_server.pipeline-staging-postgresql-server.id
  charset   = var.pipeline_staging_database_charset
  collation = var.pipeline_staging_database_collation
}


# Launching service-metadata SQL development server
resource "azurerm_private_dns_zone" "database-dns-service-metadata" {
  name                = var.service_metadata_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-service-metadata" {
  name                  = var.service_metadata_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-service-metadata.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "service-metadata-development-postgresql-server" {
  name                   = var.service_metadata_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.service_metadata_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.service_metadata_server_username
  administrator_password = var.service_metadata_server_password
  zone                   = var.service_metadata_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-service-metadata.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.service_metadata_storage_capacity

  sku_name   = var.service_metadata_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-service-metadata]
}

resource "azurerm_postgresql_flexible_server_database" "service-metadata" {
  name      = var.service_metadata_database_name
  server_id = azurerm_postgresql_flexible_server.service-metadata-development-postgresql-server.id
  charset   = var.service_metadata_database_charset
  collation = var.service_metadata_database_collation
}



# Launching superset SQL development server
resource "azurerm_private_dns_zone" "database-dns-superset" {
  name                = var.superset_server_hostname
  resource_group_name = data.azurerm_resource_group.ikigai_rg.name
} 

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-superset" {
  name                  = var.superset_server_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.database-dns-superset.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = data.azurerm_resource_group.ikigai_rg.name
}

resource "azurerm_postgresql_flexible_server" "superset-development-postgresql-server" {
  name                   = var.superset_server_name
  resource_group_name    = data.azurerm_resource_group.ikigai_rg.name
  location               = data.azurerm_resource_group.ikigai_rg.location
  version                = var.superset_server_postgres_version
  delegated_subnet_id    = var.database_subnet_id
  administrator_login    = var.superset_server_username
  administrator_password = var.superset_server_password
  zone                   = var.superset_server_zone
  private_dns_zone_id    = azurerm_private_dns_zone.database-dns-superset.id

  #TODO currently set to this number, but needs to adjusted in dev and prod to handle increased volume
  storage_mb = var.superset_storage_capacity

  sku_name   = var.superset_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnet-link-superset]
}

resource "azurerm_postgresql_flexible_server_database" "superset" {
  name      = var.superset_database_name
  server_id = azurerm_postgresql_flexible_server.superset-development-postgresql-server.id
  charset   = var.superset_database_charset
  collation = var.superset_database_collation
}
