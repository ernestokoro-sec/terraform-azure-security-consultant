variable "resource_group_name" {
  description = "Resource group containing the hub and spoke VNets"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub VNet"
  type        = string
}

variable "hub_vnet_id" {
  description = "Resource ID of the hub VNet"
  type        = string
}

variable "spoke_vnet_ids" {
  description = "Map of spoke VNet IDs"
  type        = map(string)
}

variable "spoke_vnet_names" {
  description = "Map of spoke VNet names"
  type        = map(string)
}

variable "enable_gateway_transit" {
  description = "Enable traditional hub VPN Gateway transit for spoke VNets"
  type        = bool
  default     = true
}