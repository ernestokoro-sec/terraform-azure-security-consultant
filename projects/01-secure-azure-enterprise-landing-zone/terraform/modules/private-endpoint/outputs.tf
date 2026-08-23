output "private_endpoint_ids" {
  description = "Resource IDs of the Private Endpoints"

  value = {
    for key, endpoint in azurerm_private_endpoint.endpoint :
    key => endpoint.id
  }
}

output "private_ip_addresses" {
  description = "Private IP addresses assigned to the Private Endpoints"

  value = {
    for key, endpoint in azurerm_private_endpoint.endpoint :
    key => endpoint.private_service_connection[0].private_ip_address
  }
}