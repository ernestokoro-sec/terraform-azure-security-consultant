variable "resource_group_name" {
  description = "Name of the Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where the Virtual Network will be deployed."
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "Address space assigned to the Virtual Network."
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to the Virtual Network."
  type        = map(string)
}

