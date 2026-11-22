variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region where the Key Vault will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group containing the Key Vault"
  type        = string
}

variable "tags" {
  description = "Tags applied to the Key Vault"
  type        = map(string)
  default     = {}
}