resource "azurerm_private_dns_zone" "zone" {
  for_each = var.private_dns_zones

  name                = each.value.name
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  for_each = var.private_dns_zones

  name                = "${each.key}-vnet-link"
  private_dns_zone_id = azurerm_private_dns_zone.zone[each.key].id
  virtual_network_id  = var.virtual_network_id

  registration_enabled = false

  tags = var.tags
}