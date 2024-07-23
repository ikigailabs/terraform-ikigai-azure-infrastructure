# Airbyte server outputs
output "airbyte_server_username" {
  value = azurerm_postgresql_flexible_server.airbyte-postgresql-server.administrator_login
}

output "airbyte_server_password" {
  value = azurerm_postgresql_flexible_server.airbyte-postgresql-server.administrator_password
}

output "airbyte_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-airbyte.name
}

output "airbyte_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.airbyte.name
}

# Dashhub server outputs
output "dashhub_server_username" {
  value = azurerm_postgresql_flexible_server.dashhub-postgresql-server.administrator_login
}

output "dashhub_server_password" {
  value = azurerm_postgresql_flexible_server.dashhub-postgresql-server.administrator_password
}

output "dashhub_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-dashhub.name
}

output "dashhub_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.dashhub.name
}

# Database-storage server outputs
output "database_storage_server_username" {
  value = azurerm_postgresql_flexible_server.database-storage-postgresql-server.administrator_login
}

output "database_storage_server_password" {
  value = azurerm_postgresql_flexible_server.database-storage-postgresql-server.administrator_password
}

output "database_storage_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-database-storage.name
}

output "database_storage_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.database-storage.name
}

# Jupyterhub server outputs
output "jupyterhub_server_username" {
  value = azurerm_postgresql_flexible_server.jupyterhub-postgresql-server.administrator_login
}

output "jupyterhub_server_password" {
  value = azurerm_postgresql_flexible_server.jupyterhub-postgresql-server.administrator_password
}

output "jupyterhub_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-jupyterhub.name
}

output "jupyterhub_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.jupyterhub.name
}

# Pipeline-staging server outputs
output "pipeline_staging_server_username" {
  value = azurerm_postgresql_flexible_server.pipeline-staging-postgresql-server.administrator_login
}

output "pipeline_staging_server_password" {
  value = azurerm_postgresql_flexible_server.pipeline-staging-postgresql-server.administrator_password
}

output "pipeline_staging_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-pipeline-staging.name
}

output "pipeline_staging_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.pipeline-staging.name
}

# Service-metadata server outputs
output "service_metadata_server_username" {
  value = azurerm_postgresql_flexible_server.service-metadata-development-postgresql-server.administrator_login
}

output "service_metadata_server_password" {
  value = azurerm_postgresql_flexible_server.service-metadata-development-postgresql-server.administrator_password
}

output "service_metadata_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-service-metadata.name
}

output "service_metadata_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.service-metadata.name
}

# Superset server outputs
output "superset_server_username" {
  value = azurerm_postgresql_flexible_server.superset-development-postgresql-server.administrator_login
}

output "superset_server_password" {
  value = azurerm_postgresql_flexible_server.superset-development-postgresql-server.administrator_password
}

output "superset_server_hostname" {
  value = azurerm_private_dns_zone.database-dns-superset.name
}

output "superset_server_database_name" {
  value = azurerm_postgresql_flexible_server_database.superset.name
}