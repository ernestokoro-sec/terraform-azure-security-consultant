output "vpn_gateway_id" {
  description = "Resource ID of the Azure VPN Gateway"
  value       = azurerm_virtual_network_gateway.vpn.id
}

output "vpn_gateway_name" {
  description = "Name of the Azure VPN Gateway"
  value       = azurerm_virtual_network_gateway.vpn.name
}

output "vpn_gateway_public_ip" {
  description = "Public IP address of the Azure VPN Gateway"
  value       = azurerm_public_ip.vpn_gateway.ip_address
}