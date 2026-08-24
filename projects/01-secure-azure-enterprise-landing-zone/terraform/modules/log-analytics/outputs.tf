output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.id
}

output "workspace_id" {
  description = "Workspace ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.workspace_id
}