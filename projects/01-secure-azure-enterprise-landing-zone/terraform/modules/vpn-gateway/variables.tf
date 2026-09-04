variable "vpn_gateway_name" {
  description = "Name of the Azure VPN Gateway"
  type        = string
}

variable "vpn_gateway_public_ip_name" {
  description = "Name of the Public IP used by the Azure VPN Gateway"
  type        = string
}

variable "vpn_gateway_sku" {
  description = "SKU used by the Azure VPN Gateway"
  type        = string
}

variable "location" {
  description = "Azure region for VPN Gateway resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the VPN Gateway resources"
  type        = string
}

variable "gateway_subnet_id" {
  description = "Resource ID of the existing GatewaySubnet"
  type        = string
}

variable "tags" {
  description = "Tags applied to VPN Gateway resources"
  type        = map(string)
  default     = {}
}

variable "firewall_private_ip" {
  description = "Private IP address of Azure Firewall used as the next hop for hybrid return traffic"
  type        = string
}

variable "spoke_address_spaces" {
  description = "Address spaces of spoke VNets that must be reached through Azure Firewall from GatewaySubnet"
  type        = list(string)
}