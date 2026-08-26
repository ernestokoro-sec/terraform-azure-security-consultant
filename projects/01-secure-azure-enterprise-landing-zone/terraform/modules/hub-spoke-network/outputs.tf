output "hub_vnet_id" {
  description = "Resource ID of the hub VNet"
  value       = azurerm_virtual_network.hub.id
}

output "hub_vnet_name" {
  description = "Name of the hub VNet"
  value       = azurerm_virtual_network.hub.name
}

output "spoke_vnet_ids" {
  description = "Resource IDs of the spoke VNets"

  value = {
    for key, vnet in azurerm_virtual_network.spoke :
    key => vnet.id
  }
}

output "spoke_vnet_names" {
  description = "Names of the spoke VNets"

  value = {
    for key, vnet in azurerm_virtual_network.spoke :
    key => vnet.name
  }
}