module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  tags                = var.tags
}

module "subnets" {
  source = "./modules/subnets"

  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.network.virtual_network_name
  subnets              = var.subnets
}

module "network_security_groups" {
  source = "./modules/network-security-groups"

  resource_group_name     = module.resource_group.resource_group_name
  location                = var.location
  tags                    = var.tags
  network_security_groups = var.network_security_groups
  security_rules          = var.security_rules

  subnet_associations = {
    web = {
      subnet_id = module.subnets.subnet_ids["web"]
      nsg_key   = "web"
    }

    app = {
      subnet_id = module.subnets.subnet_ids["app"]
      nsg_key   = "app"
    }

    mgmt = {
      subnet_id = module.subnets.subnet_ids["mgmt"]
      nsg_key   = "mgmt"
    }
  }
}

module "route_tables" {
  source = "./modules/route-tables"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags = merge(
    var.tags,
    {
      Project = "Azure Cloud Security Consultant Portfolio"
    }
  )

  route_tables = {
    web = {
      name                          = var.route_tables["web"].name
      bgp_route_propagation_enabled = var.route_tables["web"].bgp_route_propagation_enabled
      subnet_id                     = module.subnets.subnet_ids["web"]
      routes                        = var.route_tables["web"].routes
    }

    app = {
      name                          = var.route_tables["app"].name
      bgp_route_propagation_enabled = var.route_tables["app"].bgp_route_propagation_enabled
      subnet_id                     = module.subnets.subnet_ids["app"]
      routes                        = var.route_tables["app"].routes
    }

    mgmt = {
      name                          = var.route_tables["mgmt"].name
      bgp_route_propagation_enabled = var.route_tables["mgmt"].bgp_route_propagation_enabled
      subnet_id                     = module.subnets.subnet_ids["mgmt"]
      routes                        = var.route_tables["mgmt"].routes
    }
  }
}