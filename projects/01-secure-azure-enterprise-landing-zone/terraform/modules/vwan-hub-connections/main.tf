resource "azurerm_virtual_hub_connection" "vnet_connection" {
  for_each = var.vnet_connections

  name                      = each.value.name
  virtual_hub_id            = var.virtual_hub_id
  remote_virtual_network_id = each.value.remote_virtual_network_id
}