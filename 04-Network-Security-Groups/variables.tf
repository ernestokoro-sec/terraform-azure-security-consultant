variable "resource_group_name" {
  description = "Name of the Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region for the Network Security Groups."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Network Security Groups."
  type        = map(string)
}

variable "network_security_groups" {
  description = "Map of Network Security Groups to create."

  type = map(object({
    name = string
  }))
}

variable "security_rules" {
  description = "Map of Network Security Group rules."

  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    nsg_key                    = string
  }))
}

variable "subnet_associations" {
  description = "Map of subnet-to-NSG associations."

  type = map(object({
    subnet_id = string
    nsg_key   = string
  }))
}