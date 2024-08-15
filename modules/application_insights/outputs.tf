output "application_insights_connection_string" {
  value = azurerm_application_insights.ikigai_insight.connection_string
  description = "Connection string for the Ikigai application insights instance"
  sensitive = true
}

output "application_insights_app_id" {
  value = azurerm_application_insights.ikigai_insight.app_id
  description = "App ID for the Ikigai application insights instance"
}