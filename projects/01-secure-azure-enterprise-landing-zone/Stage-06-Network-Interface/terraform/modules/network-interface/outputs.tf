output "network_interface_id" {
  description = "Resource ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the Network Interface"
  value       = azurerm_network_interface.nic.private_ip_address
}