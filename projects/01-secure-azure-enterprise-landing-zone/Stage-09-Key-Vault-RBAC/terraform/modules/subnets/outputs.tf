output "subnet_ids" {
  description = "Map of subnet IDs created by Terraform."

  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}

output "subnet_names" {
  description = "Map of subnet names created by Terraform."

  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.name
  }
}