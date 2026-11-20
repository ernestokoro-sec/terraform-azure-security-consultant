output "resource_group_id" {
  description = "Azure Resource ID of the Resource Group."
  value       = module.resource_group.resource_group_id
}

output "resource_group_name" {
  description = "Name of the Resource Group."
  value       = module.resource_group.resource_group_name
}
