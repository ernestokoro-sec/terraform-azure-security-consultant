resource "azurerm_private_endpoint" "endpoint" {
  for_each = var.private_endpoints

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${each.value.name}-connection"
    private_connection_resource_id = each.value.private_connection_resource_id
    subresource_names              = each.value.subresource_names
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${each.value.name}-dns-group"
    private_dns_zone_ids = each.value.private_dns_zone_ids
  }

  tags = var.tags
}