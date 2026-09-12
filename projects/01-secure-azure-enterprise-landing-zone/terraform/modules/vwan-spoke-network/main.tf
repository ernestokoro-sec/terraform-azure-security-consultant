resource "azurerm_virtual_network" "spoke" {
  for_each = var.spoke_vnets

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = each.value.address_space

  tags = var.tags
}

resource "azurerm_subnet" "workload" {
  for_each = var.spoke_vnets

  name                 = each.value.workload_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke[each.key].name
  address_prefixes     = each.value.workload_subnet_prefixes
}