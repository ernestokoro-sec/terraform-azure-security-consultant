output "vpn_site_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Site"
  value       = azurerm_vpn_site.vpn_site.id
}

output "vpn_site_name" {
  description = "Name of the Azure Virtual WAN VPN Site"
  value       = azurerm_vpn_site.vpn_site.name
}

output "vpn_site_link_id" {
  description = "Resource ID of the Azure Virtual WAN VPN Site Link"
  value       = azurerm_vpn_site.vpn_site.link[0].id
}