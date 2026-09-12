output "vnet_connection_ids" {
  description = "Map of Virtual Hub-to-VNet connection resource IDs"

  value = {
    for key, connection in azurerm_virtual_hub_connection.vnet_connection :
    key => connection.id
  }
}

output "vnet_connection_names" {
  description = "Map of Virtual Hub-to-VNet connection names"

  value = {
    for key, connection in azurerm_virtual_hub_connection.vnet_connection :
    key => connection.name
  }
}