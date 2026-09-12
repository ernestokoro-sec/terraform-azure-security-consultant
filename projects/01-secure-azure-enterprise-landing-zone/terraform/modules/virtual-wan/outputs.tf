output "virtual_wan_id" {
  description = "Resource ID of the Azure Virtual WAN"
  value       = azurerm_virtual_wan.vwan.id
}

output "virtual_wan_name" {
  description = "Name of the Azure Virtual WAN"
  value       = azurerm_virtual_wan.vwan.name
}

output "virtual_hub_id" {
  description = "Resource ID of the Azure Virtual Hub"
  value       = azurerm_virtual_hub.vhub.id
}

output "virtual_hub_name" {
  description = "Name of the Azure Virtual Hub"
  value       = azurerm_virtual_hub.vhub.name
}