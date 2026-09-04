resource "azurerm_public_ip" "vpn_gateway" {
  name                = var.vpn_gateway_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "vpn" {
  name                = var.vpn_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  bgp_enabled   = false

  sku = var.vpn_gateway_sku

  ip_configuration {
    name                          = "vpn-gateway-ip-configuration"
    public_ip_address_id          = azurerm_public_ip.vpn_gateway.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }

  tags = var.tags
}

resource "azurerm_route_table" "gateway" {
  name                = "dev-gateway-subnet-rt"
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = true

  tags = var.tags
}

resource "azurerm_route" "gateway_to_spokes" {
  for_each = toset(var.spoke_address_spaces)

  name                = "to-spoke-${replace(each.value, "/", "-")}"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.gateway.name

  address_prefix         = each.value
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall_private_ip
}

resource "azurerm_subnet_route_table_association" "gateway" {
  subnet_id      = var.gateway_subnet_id
  route_table_id = azurerm_route_table.gateway.id
}