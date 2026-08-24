output "flow_log_id" {
  description = "Resource ID of the Virtual Network Flow Log"
  value       = azurerm_network_watcher_flow_log.vnet_flow_log.id
}

output "flow_log_storage_account_id" {
  description = "Resource ID of the Storage Account containing raw flow logs"
  value       = azurerm_storage_account.flow_logs.id
}