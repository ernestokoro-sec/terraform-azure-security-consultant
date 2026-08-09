variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "route_tables" {
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
  type    = map(string)
  default = {}
}