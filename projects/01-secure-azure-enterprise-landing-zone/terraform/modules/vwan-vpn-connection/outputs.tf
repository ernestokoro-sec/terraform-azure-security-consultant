output "vpn_connection_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Gateway connection"
  value       = azurerm_vpn_gateway_connection.vpn_connection.id
}

output "vpn_connection_name" {
  description = "Name of the Azure Virtual WAN VPN Gateway connection"
  value       = azurerm_vpn_gateway_connection.vpn_connection.name
}