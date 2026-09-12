variable "virtual_hub_id" {
  description = "Resource ID of the Azure Virtual Hub"
  type        = string
}

variable "vnet_connections" {
  description = "Map of VNet connections to the Azure Virtual Hub"

  type = map(object({
    name                      = string
    remote_virtual_network_id = string
  }))
}