variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for the Storage Account"
  type        = string
}

variable "tags" {
  description = "Tags applied to the Storage Account"
  type        = map(string)
  default     = {}
}