output "hub_to_spoke_peering_ids" {
  description = "Resource IDs of hub-to-spoke peerings"

  value = {
    for key, peering in azurerm_virtual_network_peering.hub_to_spoke :
    key => peering.id
  }
}

output "spoke_to_hub_peering_ids" {
  description = "Resource IDs of spoke-to-hub peerings"

  value = {
    for key, peering in azurerm_virtual_network_peering.spoke_to_hub :
    key => peering.id
  }
}