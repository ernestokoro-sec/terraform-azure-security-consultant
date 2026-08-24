variable "diagnostic_setting_name" {
  description = "Name of the Azure Monitor Diagnostic Setting"
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID of the Azure resource being monitored"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics Workspace receiving telemetry"
  type        = string
}