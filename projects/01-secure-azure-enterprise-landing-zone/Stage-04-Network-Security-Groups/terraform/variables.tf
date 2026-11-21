# --------------------------------------------------
# STAGE 01 - AZURE RESOURCE GROUP
# --------------------------------------------------

variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where the Resource Group will be created."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Resource Group."
  type        = map(string)
}



# --------------------------------------------------
# STAGE 02 - AZURE VIRTUAL NETWORK DEPLOYMENT
# -------------------------------------------------

variable "vnet_name" {
  description = "Name of the Azure Virtual Network."
  type        = string
}

variable "address_space" {
  description = "Address space assigned to the Virtual Network."
  type        = list(string)
}


# --------------------------------------------------
# STAGE 03 - AZURE SUBNET VARIABLES
# --------------------------------------------------

variable "subnets" {
  description = "Map of Azure subnets and their address prefixes."

  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

# --------------------------------------------------
# STAGE 04 - NETWORK SECURITY GROUP VARIABLES
# --------------------------------------------------

variable "network_security_groups" {
  description = "Map of Azure Network Security Groups."

  type = map(object({
    name = string
  }))
}

variable "security_rules" {
  description = "Map of NSG security rules."

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