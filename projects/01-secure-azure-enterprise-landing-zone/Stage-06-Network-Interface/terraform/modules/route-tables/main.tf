locals {
  routes = flatten([
    for route_table_key, route_table in var.route_tables : [
      for route_key, route in route_table.routes : {
        key                    = "${route_table_key}-${route_key}"
        route_table_key        = route_table_key
        name                   = route_key
        address_prefix         = route.address_prefix
        next_hop_type          = route.next_hop_type
        next_hop_in_ip_address = try(route.next_hop_in_ip_address, null)
      }
    ]
  ])

  common_tags = merge(
    var.tags,
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Engagement  = "05-Route-Tables"
    }
  )
}

# Creates one route table for each entry in var.route_tables.
resource "azurerm_route_table" "this" {
  for_each = var.route_tables

  name                          = each.value.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled

  tags = local.common_tags
}

# Creates the user-defined routes inside each route table.
resource "azurerm_route" "this" {
  for_each = {
    for route in local.routes :
    route.key => route
  }

  name                   = each.value.name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.this[each.value.route_table_key].name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}

# Associates each route table with its designated subnet.
resource "azurerm_subnet_route_table_association" "this" {
  for_each = var.route_tables

  subnet_id      = each.value.subnet_id
  route_table_id = azurerm_route_table.this[each.key].id
}