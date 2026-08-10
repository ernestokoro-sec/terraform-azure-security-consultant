variable "bastion_name" {
  description = "Name of the Azure Bastion host"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Bastion public IP"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing Azure Bastion"
  type        = string
}

variable "bastion_subnet_id" {
  description = "Resource ID of AzureBastionSubnet"
  type        = string
}

variable "tags" {
  description = "Tags applied to Bastion resources"
  type        = map(string)
  default     = {}
}