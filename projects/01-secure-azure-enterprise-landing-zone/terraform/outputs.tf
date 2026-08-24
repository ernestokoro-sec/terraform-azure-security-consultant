output "azure_policy_definition_id" {
  description = "Resource ID of the custom Azure Policy definition"
  value       = module.azure_policy.policy_definition_id
}

output "azure_policy_assignment_id" {
  description = "Resource ID of the Azure Policy assignment"
  value       = module.azure_policy.policy_assignment_id
}