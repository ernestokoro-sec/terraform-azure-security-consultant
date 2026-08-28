resource "azurerm_route_table" "spoke" {
  for_each = var.spoke_subnet_ids

  name                = "dev-${each.key}-rt"
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = true

  tags = var.tags
}

resource "azurerm_route" "default_to_firewall" {
  for_each = var.spoke_subnet_ids

  name                = "default-to-azure-firewall"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.spoke[each.key].name

  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall_private_ip
}

resource "azurerm_route" "east_west_to_firewall" {
  for_each = var.east_west_routes

  name                = each.value.route_name
  resource_group_name = var.resource_group_name

  route_table_name = azurerm_route_table.spoke[
    each.value.source_spoke
  ].name

  address_prefix         = each.value.destination_prefix
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall_private_ip
}

resource "azurerm_subnet_route_table_association" "spoke" {
  for_each = var.spoke_subnet_ids

  subnet_id      = each.value
  route_table_id = azurerm_route_table.spoke[each.key].id
}

