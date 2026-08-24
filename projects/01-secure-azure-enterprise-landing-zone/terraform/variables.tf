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
variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "private_dns_zones" {
  description = "Private DNS zones used by Azure Private Endpoints"

  type = map(object({
    name = string
  }))
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "log_analytics_retention_days" {
  description = "Number of days to retain Log Analytics data"
  type        = number
  default     = 30
}

variable "key_vault_diagnostic_setting_name" {
  description = "Name of the Key Vault Diagnostic Setting"
  type        = string
}

variable "flow_log_name" {
  description = "Name of the Virtual Network Flow Log"
  type        = string
}

variable "flow_log_storage_account_name" {
  description = "Storage Account used for VNet flow logs"
  type        = string
}

variable "network_watcher_name" {
  description = "Name of the regional Network Watcher"
  type        = string
}

variable "network_watcher_resource_group_name" {
  description = "Resource Group containing Network Watcher"
  type        = string
}

variable "enable_defender_for_servers" {
  description = "Enable Microsoft Defender for Servers"
  type        = bool
  default     = true
}