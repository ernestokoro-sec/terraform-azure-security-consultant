variable "vpn_gateway_name" {
  description = "Name of the Azure Virtual WAN VPN Gateway"
  type        = string
}

variable "location" {
  description = "Azure region where the Virtual WAN VPN Gateway will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Virtual WAN VPN Gateway"
  type        = string
}

variable "virtual_hub_id" {
  description = "Resource ID of the Azure Virtual Hub that will contain the VPN Gateway"
  type        = string
}

variable "vpn_gateway_scale_unit" {
  description = "Scale unit for the Azure Virtual WAN VPN Gateway"
  type        = number
}