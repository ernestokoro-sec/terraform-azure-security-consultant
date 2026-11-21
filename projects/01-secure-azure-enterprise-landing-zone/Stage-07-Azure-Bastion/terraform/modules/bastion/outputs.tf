output "bastion_id" {
  description = "Resource ID of the Azure Bastion host"
  value       = azurerm_bastion_host.bastion.id
}

output "public_ip_address" {
  description = "Public IP address assigned to Azure Bastion"
  value       = azurerm_public_ip.bastion.ip_address
}