resource "azurerm_local_network_gateway" "onpremises" {
  name                = var.local_network_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  gateway_address = var.onpremises_gateway_address
  address_space   = var.onpremises_address_spaces

  tags = var.tags
}