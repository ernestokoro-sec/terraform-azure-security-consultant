output "policy_definition_id" {
  description = "Resource ID of the custom Azure Policy definition"
  value       = azurerm_policy_definition.required_environment_tag.id
}

output "policy_assignment_id" {
  description = "Resource ID of the Azure Policy assignment"
  value       = azurerm_subscription_policy_assignment.required_environment_tag.id
}