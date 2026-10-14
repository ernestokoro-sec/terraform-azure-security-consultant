variable "resource_group_name" {
  description = "Name of the Resource Group that will contain the Terraform backend resources"
  type        = string
}

variable "location" {
  description = "Azure region for the Terraform backend resources"
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique Azure Storage Account name used for Terraform state"
  type        = string
}

variable "container_name" {
  description = "Blob container name used to store Terraform state files"
  type        = string
}

variable "tags" {
  description = "Tags applied to the backend resources"
  type        = map(string)
  default     = {}
}