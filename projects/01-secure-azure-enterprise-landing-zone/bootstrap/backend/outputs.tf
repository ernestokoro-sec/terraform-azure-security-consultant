output "resource_group_name" {
  description = "Name of the Terraform backend Resource Group"
  value       = azurerm_resource_group.tfstate.name
}

output "storage_account_name" {
  description = "Name of the Terraform backend Storage Account"
  value       = azurerm_storage_account.tfstate.name
}

output "container_name" {
  description = "Name of the Terraform state Blob container"
  value       = azurerm_storage_container.tfstate.name
}

output "storage_account_id" {
  description = "Resource ID of the Terraform backend Storage Account"
  value       = azurerm_storage_account.tfstate.id
}