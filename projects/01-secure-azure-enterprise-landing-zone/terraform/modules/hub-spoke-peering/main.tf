# ============================================================
# Hub-to-Spoke VNet Peering
# ============================================================

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  for_each = var.spoke_vnet_ids

  name = "${var.hub_vnet_name}-to-${var.spoke_vnet_names[each.key]}"

  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = each.value

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # Allow the hub's traditional VPN Gateway to be shared.
  allow_gateway_transit = var.enable_gateway_transit
}


# ============================================================
# Spoke-to-Hub VNet Peering
# ============================================================

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  for_each = var.spoke_vnet_ids

  name = "${var.spoke_vnet_names[each.key]}-to-${var.hub_vnet_name}"

  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.spoke_vnet_names[each.key]
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # Use the traditional VPN Gateway in the hub VNet.
  use_remote_gateways = var.enable_gateway_transit

  # Establish the hub-side peering first.
  depends_on = [
    azurerm_virtual_network_peering.hub_to_spoke
  ]
}