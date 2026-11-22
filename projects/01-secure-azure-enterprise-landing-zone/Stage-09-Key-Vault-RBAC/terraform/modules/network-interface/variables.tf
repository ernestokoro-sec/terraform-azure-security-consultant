variable "nic_name" {
  description = "Name of the Azure Network Interface"
  type        = string
}

variable "location" {
  description = "Azure region where the Network Interface will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group containing the Network Interface"
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the subnet to which the Network Interface will connect"
  type        = string
}

variable "tags" {
  description = "Tags applied to the Network Interface"
  type        = map(string)
  default     = {}
}