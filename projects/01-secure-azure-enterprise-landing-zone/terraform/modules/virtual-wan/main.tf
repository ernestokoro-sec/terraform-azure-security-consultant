resource "azurerm_virtual_wan" "vwan" {
  name                = var.virtual_wan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type = "Standard"

  tags = var.tags
}

resource "azurerm_virtual_hub" "vhub" {
  name                = var.virtual_hub_name
  location            = var.location
  resource_group_name = var.resource_group_name

  virtual_wan_id = azurerm_virtual_wan.vwan.id
  address_prefix = var.virtual_hub_address_prefix

  tags = var.tags
}