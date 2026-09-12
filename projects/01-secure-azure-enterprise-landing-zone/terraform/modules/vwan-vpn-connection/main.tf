resource "azurerm_vpn_gateway_connection" "vpn_connection" {
  name               = var.vpn_connection_name
  vpn_gateway_id     = var.vpn_gateway_id
  remote_vpn_site_id = var.vpn_site_id

  vpn_link {
    name             = var.vpn_link_name
    vpn_site_link_id = var.vpn_site_link_id
    shared_key       = var.shared_key
  }
}