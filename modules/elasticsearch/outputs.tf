output "component_logs_elasticsearch_cloud_id" {
  value = azurerm_elastic_cloud_elasticsearch.component_elasticsearch.id
  description = "Cloud ID of the Ikigai component logs elasticsearch instance"
}

output "monitor_elasticsearch_cloud_id" {
  value = azurerm_elastic_cloud_elasticsearch.monitor_elasticsearch.id
  description = "Cloud ID of the Ikigai monitoring elasticsearch instance"
}