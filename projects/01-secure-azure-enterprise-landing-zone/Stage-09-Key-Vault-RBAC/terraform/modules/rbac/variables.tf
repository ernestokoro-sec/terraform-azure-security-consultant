variable "scope" {
  description = "Azure resource ID defining the scope of the role assignment"
  type        = string
}

variable "role_definition_name" {
  description = "Name of the Azure RBAC role"
  type        = string
}

variable "principal_id" {
  description = "Object ID of the identity receiving the role"
  type        = string
}