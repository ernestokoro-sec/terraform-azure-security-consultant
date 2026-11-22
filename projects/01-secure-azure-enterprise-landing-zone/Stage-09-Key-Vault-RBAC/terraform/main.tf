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


# --------------------------------------------------
# STAGE 05 - AZURE ROUTE TABLES AND UDRs
# --------------------------------------------------

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

      # Stage 03 uses "management" as its subnet key.
      subnet_id = module.subnets.subnet_ids["management"]

      routes = var.route_tables["mgmt"].routes
    }
  }
}

# --------------------------------------------------
# STAGE 06 - AZURE NETWORK INTERFACE
# --------------------------------------------------

module "network_interface" {
  source = "./modules/network-interface"

  nic_name            = var.nic_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnets.subnet_ids["management"]

  tags = var.tags
}


# --------------------------------------------------
# STAGE 07 - AZURE BASTION
# --------------------------------------------------

module "bastion" {
  source = "./modules/bastion"

  bastion_name        = var.bastion_name
  public_ip_name      = var.bastion_public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  bastion_subnet_id = module.subnets.subnet_ids["bastion"]

  tags = var.tags
}


# --------------------------------------------------
# STAGE 08 - WINDOWS VIRTUAL MACHINE
# --------------------------------------------------

module "windows_vm" {
  source = "./modules/windows-vm"

  vm_name              = var.vm_name
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  network_interface_id = module.network_interface.network_interface_id

  tags = var.tags
}

# --------------------------------------------------
# STAGE 09 - AZURE KEY VAULT
# --------------------------------------------------

module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  tags = var.tags
}


# --------------------------------------------------
# STAGE 09 - AZURE KEY VAULT RBAC ASSIGNMENT
# --------------------------------------------------

module "key_vault_rbac" {
  source = "./modules/rbac"

  scope                = module.key_vault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.windows_vm.principal_id
}