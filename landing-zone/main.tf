module "route_tables" {
  source = "./modules/route-tables"

  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment

  route_tables = var.route_tables

  tags = var.tags
}