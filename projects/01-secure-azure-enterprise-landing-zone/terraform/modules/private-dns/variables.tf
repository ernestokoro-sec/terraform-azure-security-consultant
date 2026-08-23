variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "virtual_network_id" {
  description = "Resource ID of the VNet linked to the Private DNS zones"
  type        = string
}

variable "private_dns_zones" {
  description = "Private DNS zones to create"
  type = map(object({
    name = string
  }))
}

variable "tags" {
  description = "Tags applied to Private DNS resources"
  type        = map(string)
  default     = {}
}