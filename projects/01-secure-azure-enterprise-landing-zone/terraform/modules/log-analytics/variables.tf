variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "location" {
  description = "Azure region for the Log Analytics Workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the Log Analytics Workspace"
  type        = string
}

variable "retention_in_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags applied to the Log Analytics Workspace"
  type        = map(string)
  default     = {}
}