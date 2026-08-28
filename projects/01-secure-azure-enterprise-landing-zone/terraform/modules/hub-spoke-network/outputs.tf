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

output "spoke_workload_subnet_ids" {
  description = "Resource IDs of the workload subnets in each spoke"

  value = {
    for key, subnet in azurerm_subnet.spoke_workload :
    key => subnet.id
  }
}

output "azure_firewall_subnet_id" {
  description = "Resource ID of AzureFirewallSubnet in the hub VNet"
  value       = azurerm_subnet.azure_firewall.id
}