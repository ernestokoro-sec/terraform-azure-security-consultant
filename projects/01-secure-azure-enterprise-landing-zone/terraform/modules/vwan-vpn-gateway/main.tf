resource "azurerm_vpn_gateway" "vpn_gateway" {
  name                = var.vpn_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_hub_id      = var.virtual_hub_id
  scale_unit          = var.vpn_gateway_scale_unit
}