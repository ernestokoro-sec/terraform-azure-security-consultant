variable "vm_name" {
  description = "Name of the Windows Virtual Machine"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group containing the Virtual Machine"
  type        = string
}

variable "location" {
  description = "Azure region where the Virtual Machine will be deployed"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the Virtual Machine"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the Virtual Machine"
  type        = string
  sensitive   = true
}

variable "network_interface_id" {
  description = "Resource ID of the Network Interface attached to the Virtual Machine"
  type        = string
}

variable "tags" {
  description = "Tags applied to the Virtual Machine"
  type        = map(string)
  default     = {}
}