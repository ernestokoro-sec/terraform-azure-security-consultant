variable "firewall_name" {
  description = "Name of the Azure Firewall"
  type        = string
}

variable "firewall_policy_name" {
  description = "Name of the Azure Firewall Policy"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Azure Firewall Public IP"
  type        = string
}

variable "location" {
  description = "Azure region for Azure Firewall resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing Azure Firewall resources"
  type        = string
}

variable "firewall_subnet_id" {
  description = "Resource ID of AzureFirewallSubnet"
  type        = string
}

variable "tags" {
  description = "Tags applied to Azure Firewall resources"
  type        = map(string)
  default     = {}
}

variable "spoke_address_spaces" {
  description = "Address spaces of spoke VNets allowed for east-west traffic"
  type        = list(string)
}