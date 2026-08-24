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
module "network_interface" {
  source = "./modules/network-interface"

  nic_name            = var.nic_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnets.subnet_ids["mgmt"]

  tags = var.tags
}

module "bastion" {
  source = "./modules/bastion"

  bastion_name        = var.bastion_name
  public_ip_name      = var.bastion_public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  bastion_subnet_id = module.subnets.subnet_ids["bastion"]

  tags = var.tags
}

module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  tags = var.tags
}

module "key_vault_rbac" {
  source = "./modules/rbac"

  scope                = module.key_vault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.windows_vm.principal_id
}

module "storage_account" {
  source = "./modules/storage-account"

  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location

  tags = var.tags
}

module "private_dns" {
  source = "./modules/private-dns"

  resource_group_name = module.resource_group.resource_group_name
  virtual_network_id  = module.network.virtual_network_id
  private_dns_zones   = var.private_dns_zones

  tags = var.tags
}

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

module "private_endpoint" {
  source = "./modules/private-endpoint"

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnets.subnet_ids["private_endpoint"]

  private_endpoints = {
    keyvault = {
      name                           = "dev-keyvault-pe"
      private_connection_resource_id = module.key_vault.key_vault_id
      subresource_names              = ["vault"]
      private_dns_zone_ids = [
        module.private_dns.private_dns_zone_ids["keyvault"]
      ]
    }

    blob = {
      name                           = "dev-storage-blob-pe"
      private_connection_resource_id = module.storage_account.storage_account_id
      subresource_names              = ["blob"]
      private_dns_zone_ids = [
        module.private_dns.private_dns_zone_ids["blob"]
      ]
    }
  }

  tags = var.tags
}

module "log_analytics" {
  source = "./modules/log-analytics"

  log_analytics_workspace_name = var.log_analytics_workspace_name
  location                     = var.location
  resource_group_name          = module.resource_group.resource_group_name
  retention_in_days            = var.log_analytics_retention_days

  tags = var.tags
}


module "key_vault_diagnostics" {
  source = "./modules/diagnostic-settings"

  diagnostic_setting_name    = var.key_vault_diagnostic_setting_name
  target_resource_id         = module.key_vault.key_vault_id
  log_analytics_workspace_id = module.log_analytics.log_analytics_workspace_id
}

module "vnet_flow_logs" {
  source = "./modules/vnet-flow-logs"

  flow_log_name                 = var.flow_log_name
  flow_log_storage_account_name = var.flow_log_storage_account_name

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  network_watcher_name                = var.network_watcher_name
  network_watcher_resource_group_name = var.network_watcher_resource_group_name

  virtual_network_id = module.network.virtual_network_id

  log_analytics_workspace_id     = module.log_analytics.log_analytics_workspace_id
  log_analytics_workspace_guid   = module.log_analytics.workspace_id
  log_analytics_workspace_region = var.location

  retention_days = 30

  tags = var.tags
}


module "defender_for_cloud" {
  source = "./modules/defender-for-cloud"

  enable_defender_for_servers = var.enable_defender_for_servers
}