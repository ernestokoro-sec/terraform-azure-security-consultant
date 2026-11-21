# --------------------------------------------------
# STAGE 01 - AZURE RESOURCE GROUP
# --------------------------------------------------

module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# --------------------------------------------------
# STAGE 02 - AZURE VIRTUAL NETWORK DEPLOYMENT
# -------------------------------------------------

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  tags                = var.tags
}


# --------------------------------------------------
# STAGE 03 - AZURE SUBNET DEPLOYMENT
# --------------------------------------------------

module "subnets" {
  source = "./modules/subnets"

  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.network.virtual_network_name
  subnets              = var.subnets
}

# --------------------------------------------------
# STAGE 04 - AZURE NETWORK SECURITY GROUPS
# --------------------------------------------------

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
      subnet_id = module.subnets.subnet_ids["management"]
      nsg_key   = "mgmt"
    }
  }
}
