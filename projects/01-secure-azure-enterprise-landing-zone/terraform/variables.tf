variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "network_security_groups" {
  type = map(object({
    name = string
  }))
}

variable "security_rules" {
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

variable "route_tables" {
  type = map(object({
    name                          = string
    bgp_route_propagation_enabled = optional(bool, true)
    subnet_id                     = optional(string)

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

variable "nic_name" {
  description = "Name of the management VM Network Interface"
  type        = string
}

variable "vm_name" {
  description = "Name of the Windows management Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Windows management Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the Windows management Virtual Machine"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the Windows management Virtual Machine"
  type        = string
  sensitive   = true
}

variable "bastion_name" {
  description = "Name of the Azure Bastion host"
  type        = string
}

variable "bastion_public_ip_name" {
  description = "Name of the Bastion public IP"
  type        = string
}