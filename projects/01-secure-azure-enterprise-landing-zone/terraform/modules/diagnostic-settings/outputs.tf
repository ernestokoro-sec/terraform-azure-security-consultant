output "diagnostic_setting_id" {
  description = "Resource ID of the Diagnostic Setting"
  value       = azurerm_monitor_diagnostic_setting.this.id
}