output "virtual_network_id" {
  description = "Resource ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_name" {
  description = "Name of the Virtual Network."
  value       = azurerm_virtual_network.vnet.name
}

output "address_space" {
  description = "Address space assigned to the Virtual Network."
  value       = azurerm_virtual_network.vnet.address_space
}
