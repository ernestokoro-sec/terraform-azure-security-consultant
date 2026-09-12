variable "resource_group_name" {
  description = "Name of the resource group containing the vWAN spoke VNets"
  type        = string
}

variable "location" {
  description = "Azure region where the vWAN spoke VNets will be deployed"
  type        = string
}

variable "spoke_vnets" {
  description = "Map of spoke VNets and workload subnets used by the Azure Virtual WAN architecture"

  type = map(object({
    name                     = string
    address_space            = list(string)
    workload_subnet_name     = string
    workload_subnet_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Tags applied to the vWAN spoke networking resources"
  type        = map(string)
  default     = {}
}