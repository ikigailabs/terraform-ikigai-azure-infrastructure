output "application_insights_connection_string" {
  value = azurerm_application_insights.ikigai_insight.connection_string
  description = "Connection string for the Ikigai application insights instance"
}

output "test" {
  value = "hello there"
}