output "local_network_gateway_id" {
  description = "Resource ID of the Azure Local Network Gateway"
  value       = azurerm_local_network_gateway.onpremises.id
}

output "local_network_gateway_name" {
  description = "Name of the Azure Local Network Gateway"
  value       = azurerm_local_network_gateway.onpremises.name
}