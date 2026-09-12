resource "azurerm_vpn_site" "vpn_site" {
  name                = var.vpn_site_name
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_wan_id      = var.virtual_wan_id
  address_cidrs       = var.onprem_address_cidrs

  link {
    name       = "${var.vpn_site_name}-link"
    ip_address = var.onprem_public_ip
  }
}