variable "vpn_site_name" {
  description = "Name of the Azure Virtual WAN VPN Site"
  type        = string
}

variable "location" {
  description = "Azure region where the VPN Site will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the VPN Site"
  type        = string
}

variable "virtual_wan_id" {
  description = "Resource ID of the Azure Virtual WAN"
  type        = string
}

variable "onprem_address_cidrs" {
  description = "Address prefixes used by the on-premises network"
  type        = list(string)
}

variable "onprem_public_ip" {
  description = "Public IP address of the on-premises VPN device"
  type        = string
}