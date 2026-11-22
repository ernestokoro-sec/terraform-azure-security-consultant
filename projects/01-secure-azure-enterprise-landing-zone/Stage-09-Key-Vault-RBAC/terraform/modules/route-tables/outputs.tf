output "route_table_ids" {
  description = "Map of route table keys to Azure resource IDs."

  value = {
    for key, route_table in azurerm_route_table.this :
    key => route_table.id
  }
}

output "route_table_names" {
  description = "Map of route table keys to deployed route table names."

  value = {
    for key, route_table in azurerm_route_table.this :
    key => route_table.name
  }
}

output "route_ids" {
  description = "Map of route keys to Azure route resource IDs."

  value = {
    for key, route in azurerm_route.this :
    key => route.id
  }
}

output "subnet_association_ids" {
  description = "Map of route table keys to subnet association IDs."

  value = {
    for key, association in azurerm_subnet_route_table_association.this :
    key => association.id
  }
}