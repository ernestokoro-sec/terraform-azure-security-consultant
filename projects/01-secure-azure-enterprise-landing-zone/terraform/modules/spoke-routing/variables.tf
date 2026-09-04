variable "location" {
  description = "Azure region for spoke route tables"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the spoke route tables"
  type        = string
}

variable "spoke_subnet_ids" {
  description = "Map of spoke workload subnet IDs"
  type        = map(string)
}

variable "firewall_private_ip" {
  description = "Private IP address of Azure Firewall used as the next hop"
  type        = string
}

variable "tags" {
  description = "Tags applied to spoke routing resources"
  type        = map(string)
  default     = {}
}

variable "east_west_routes" {
  description = "Routes used to force spoke-to-spoke traffic through Azure Firewall"

  type = map(object({
    source_spoke       = string
    destination_prefix = string
    route_name         = string
  }))
}

variable "hybrid_routes" {
  description = "Routes used to force spoke-to-on-premises traffic through Azure Firewall"

  type = map(object({
    source_spoke       = string
    destination_prefix = string
    route_name         = string
  }))
}