output "vpn_gateway_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Gateway"
  value       = azurerm_vpn_gateway.vpn_gateway.id
}

output "vpn_gateway_name" {
  description = "Name of the Azure Virtual WAN VPN Gateway"
  value       = azurerm_vpn_gateway.vpn_gateway.name
}