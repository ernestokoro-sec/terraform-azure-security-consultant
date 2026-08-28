output "spoke_route_table_ids" {
  description = "Resource IDs of the spoke route tables"

  value = {
    for key, route_table in azurerm_route_table.spoke :
    key => route_table.id
  }
}