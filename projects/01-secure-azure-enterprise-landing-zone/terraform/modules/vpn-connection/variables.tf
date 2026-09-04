variable "vpn_connection_name" {
  description = "Name of the Site-to-Site VPN connection"
  type        = string
}

variable "location" {
  description = "Azure region for the VPN connection"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the VPN connection"
  type        = string
}

variable "virtual_network_gateway_id" {
  description = "Resource ID of the Azure VPN Gateway"
  type        = string
}

variable "local_network_gateway_id" {
  description = "Resource ID of the Azure Local Network Gateway"
  type        = string
}

variable "shared_key" {
  description = "Pre-shared key used to secure the Site-to-Site VPN connection"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to the VPN connection"
  type        = map(string)
  default     = {}
}