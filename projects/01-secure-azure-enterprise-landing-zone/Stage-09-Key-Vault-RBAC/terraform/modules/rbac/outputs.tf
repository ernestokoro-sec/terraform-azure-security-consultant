output "role_assignment_id" {
  description = "Resource ID of the RBAC role assignment"
  value       = azurerm_role_assignment.this.id
}