variable "local_network_gateway_name" {
  description = "Name of the Azure Local Network Gateway"
  type        = string
}

variable "location" {
  description = "Azure region for the Local Network Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the Local Network Gateway"
  type        = string
}

variable "onpremises_gateway_address" {
  description = "Public IP address of the on-premises VPN device"
  type        = string
}

variable "onpremises_address_spaces" {
  description = "Private network address spaces located behind the on-premises VPN device"
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to the Local Network Gateway"
  type        = map(string)
  default     = {}
}