variable "vpn_gateway_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Gateway"
  type        = string
}

variable "vpn_site_link_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Site Link"
  type        = string
}

variable "vpn_connection_name" {
  description = "Name of the Azure Virtual WAN VPN Gateway connection"
  type        = string
}

variable "vpn_link_name" {
  description = "Name of the VPN link connection"
  type        = string
}

variable "shared_key" {
  description = "Pre-shared key used to secure the Site-to-Site VPN connection"
  type        = string
  sensitive   = true
}

variable "vpn_site_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Site"
  type        = string
}