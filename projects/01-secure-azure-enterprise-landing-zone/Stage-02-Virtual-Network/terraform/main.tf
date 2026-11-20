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
