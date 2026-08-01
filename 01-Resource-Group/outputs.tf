output "resource_group_id" {
  description = "Azure Resource ID of the Resource Group."
  value       = azurerm_resource_group.rg.id
}

output "resource_group_name" {
  description = "Name of the Resource Group."
  value       = azurerm_resource_group.rg.name
}