output "firewall_id" {
  description = "Resource ID of the Azure Firewall"
  value       = azurerm_firewall.firewall.id
}

output "firewall_private_ip" {
  description = "Private IP address assigned to Azure Firewall"
  value       = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}

output "firewall_public_ip" {
  description = "Public IP address assigned to Azure Firewall"
  value       = azurerm_public_ip.firewall.ip_address
}

output "firewall_policy_id" {
  description = "Resource ID of the Azure Firewall Policy"
  value       = azurerm_firewall_policy.firewall.id
}