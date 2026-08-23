variable "location" {
  description = "Azure region for the Private Endpoints"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the Private Endpoints"
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the dedicated Private Endpoint subnet"
  type        = string
}

variable "private_endpoints" {
  description = "Private Endpoints to create"

  type = map(object({
    name                           = string
    private_connection_resource_id = string
    subresource_names              = list(string)
    private_dns_zone_ids           = list(string)
  }))
}

variable "tags" {
  description = "Tags applied to Private Endpoints"
  type        = map(string)
  default     = {}
}