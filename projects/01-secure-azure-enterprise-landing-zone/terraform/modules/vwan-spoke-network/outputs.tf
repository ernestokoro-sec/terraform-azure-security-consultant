output "spoke_vnet_ids" {
  description = "Map of vWAN spoke VNet resource IDs"

  value = {
    for key, vnet in azurerm_virtual_network.spoke :
    key => vnet.id
  }
}

output "spoke_vnet_names" {
  description = "Map of vWAN spoke VNet names"

  value = {
    for key, vnet in azurerm_virtual_network.spoke :
    key => vnet.name
  }
}

output "workload_subnet_ids" {
  description = "Map of workload subnet resource IDs"

  value = {
    for key, subnet in azurerm_subnet.workload :
    key => subnet.id
  }
}