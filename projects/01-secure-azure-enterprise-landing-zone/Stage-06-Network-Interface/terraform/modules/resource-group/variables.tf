variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "Resource Group name must not be empty."
  }
}

variable "location" {
  description = "Azure region where the Resource Group will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "Azure location must not be empty."
  }
}

variable "tags" {
  description = "Tags applied to the Resource Group."
  type        = map(string)

  validation {
    condition = alltrue([
      for key, value in var.tags :
      length(trimspace(key)) > 0 && length(trimspace(value)) > 0
    ])
    error_message = "Tag keys and values must not be empty."
  }
}