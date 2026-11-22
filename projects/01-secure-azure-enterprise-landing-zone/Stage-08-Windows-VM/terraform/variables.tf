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

# --------------------------------------------------
# STAGE 05 - ROUTE TABLE VARIABLES
# --------------------------------------------------

variable "route_tables" {
  description = "Configuration of route tables and user-defined routes."

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

variable "environment" {
  description = "Deployment environment such as dev, test, or prod."
  type        = string
}


# --------------------------------------------------
# STAGE 06 - NETWORK INTERFACE VARIABLES
# --------------------------------------------------

variable "nic_name" {
  description = "Name of the management VM Network Interface"
  type        = string
}



variable "bastion_name" {
  description = "Name of the Azure Bastion host"
  type        = string
}

variable "bastion_public_ip_name" {
  description = "Name of the Azure Bastion public IP"
  type        = string
}

# --------------------------------------------------
# STAGE 08 - WINDOWS VIRTUAL MACHINE
# --------------------------------------------------

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