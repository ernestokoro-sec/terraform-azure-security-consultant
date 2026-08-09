variable "resource_group_name" {
  description = "Name of the resource group containing the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region where the route tables will be created."
  type        = string
}

variable "environment" {
  description = "Deployment environment such as dev, test, or prod."
  type        = string
}

variable "route_tables" {
  description = "Configuration of route tables, routes, and subnet associations."

  type = map(object({
    name                          = string
    bgp_route_propagation_enabled = optional(bool, true)
    subnet_id                     = string

    routes = map(object({
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    }))
  }))
}

variable "tags" {
  description = "Tags applied to the route tables."
  type        = map(string)
  default     = {}
}