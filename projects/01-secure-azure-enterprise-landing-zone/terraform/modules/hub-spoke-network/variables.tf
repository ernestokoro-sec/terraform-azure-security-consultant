variable "location" {
  description = "Azure region for the hub and spoke VNets"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the hub and spoke VNets"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub VNet"
  type        = string
}

variable "hub_address_space" {
  description = "Address space for the hub VNet"
  type        = list(string)
}

variable "spoke_vnets" {
  description = "Map of spoke VNets to create"

  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "tags" {
  description = "Tags applied to hub and spoke resources"
  type        = map(string)
  default     = {}
}