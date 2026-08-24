variable "flow_log_name" {
  description = "Name of the Virtual Network Flow Log"
  type        = string
}

variable "flow_log_storage_account_name" {
  description = "Name of the Storage Account used for raw VNet flow logs"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group used for the flow log Storage Account"
  type        = string
}

variable "network_watcher_name" {
  description = "Name of the regional Azure Network Watcher"
  type        = string
}

variable "network_watcher_resource_group_name" {
  description = "Resource Group containing Azure Network Watcher"
  type        = string
}

variable "virtual_network_id" {
  description = "Resource ID of the VNet being monitored"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Azure Resource ID of the Log Analytics Workspace"
  type        = string
}

variable "log_analytics_workspace_guid" {
  description = "Workspace GUID used by Traffic Analytics"
  type        = string
}

variable "log_analytics_workspace_region" {
  description = "Azure region of the Log Analytics Workspace"
  type        = string
}

variable "retention_days" {
  description = "Number of days to retain VNet flow logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags applied to flow log resources"
  type        = map(string)
  default     = {}
}