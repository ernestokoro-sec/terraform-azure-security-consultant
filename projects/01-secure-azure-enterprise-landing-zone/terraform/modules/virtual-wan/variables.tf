variable "virtual_wan_name" {
  description = "Name of the Azure Virtual WAN"
  type        = string
}

variable "virtual_hub_name" {
  description = "Name of the Azure Virtual Hub"
  type        = string
}

variable "virtual_hub_address_prefix" {
  description = "Address prefix assigned to the Azure Virtual Hub"
  type        = string
}

variable "location" {
  description = "Azure region where the Virtual WAN resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Virtual WAN resources"
  type        = string
}

variable "tags" {
  description = "Tags applied to the Virtual WAN resources"
  type        = map(string)
  default     = {}
}