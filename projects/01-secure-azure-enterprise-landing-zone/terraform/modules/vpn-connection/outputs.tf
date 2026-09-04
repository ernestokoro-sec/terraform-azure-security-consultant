output "vpn_connection_id" {
  description = "Resource ID of the Site-to-Site VPN connection"
  value       = azurerm_virtual_network_gateway_connection.s2s.id
}

output "vpn_connection_name" {
  description = "Name of the Site-to-Site VPN connection"
  value       = azurerm_virtual_network_gateway_connection.s2s.name
}