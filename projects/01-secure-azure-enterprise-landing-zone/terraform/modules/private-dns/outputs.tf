output "private_dns_zone_ids" {
  description = "Resource IDs of the Private DNS zones"

  value = {
    for key, zone in azurerm_private_dns_zone.zone :
    key => zone.id
  }
}