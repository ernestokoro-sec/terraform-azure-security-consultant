resource_group_name = "tf-dev-rg"

location    = "uksouth"
environment = "dev"

vnet_name     = "dev-uks-vnet"
address_space = ["10.10.0.0/16"]

subnets = {
  web = {
    name             = "dev-web-subnet"
    address_prefixes = ["10.10.1.0/24"]
  }

  app = {
    name             = "dev-app-subnet"
    address_prefixes = ["10.10.2.0/24"]
  }

  mgmt = {
    name             = "dev-mgmt-subnet"
    address_prefixes = ["10.10.3.0/24"]
  }

  private_endpoint = {
    name             = "dev-private-endpoint-subnet"
    address_prefixes = ["10.10.254.0/26"]
  }

  bastion = {
    name             = "AzureBastionSubnet"
    address_prefixes = ["10.10.250.0/26"]
  }
}

network_security_groups = {
  web = {
    name = "dev-web-nsg"
  }

  app = {
    name = "dev-app-nsg"
  }

  mgmt = {
    name = "dev-mgmt-nsg"
  }
}

security_rules = {
  allow-http = {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    nsg_key                    = "web"
  }

  allow-https = {
    name                       = "Allow-HTTPS"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    nsg_key                    = "web"
  }
}

route_tables = {
  web = {
    name                          = "dev-web-rt"
    bgp_route_propagation_enabled = true

    routes = {
      block-private-10 = {
        address_prefix = "10.0.0.0/8"
        next_hop_type  = "None"
      }
    }
  }

  app = {
    name                          = "dev-app-rt"
    bgp_route_propagation_enabled = true

    routes = {
      block-private-10 = {
        address_prefix = "10.0.0.0/8"
        next_hop_type  = "None"
      }
    }
  }

  mgmt = {
    name                          = "dev-mgmt-rt"
    bgp_route_propagation_enabled = true

    routes = {
      block-private-10 = {
        address_prefix = "10.0.0.0/8"
        next_hop_type  = "None"
      }
    }
  }
}

tags = {
  Environment = "dev"
  Project     = "terraform-azure"
  ManagedBy   = "Terraform"
}
nic_name = "dev-mgmt-nic"

bastion_name           = "dev-uks-bastion"
bastion_public_ip_name = "dev-uks-bastion-pip"

key_vault_name = "kvdevuks"

storage_account_name = "stdevuks001"

private_dns_zones = {
  keyvault = {
    name = "privatelink.vaultcore.azure.net"
  }

  blob = {
    name = "privatelink.blob.core.windows.net"
  }
}

log_analytics_workspace_name = "dev-uks-law"
log_analytics_retention_days = 30

key_vault_diagnostic_setting_name = "dev-keyvault-diagnostics"

flow_log_name                 = "dev-uks-vnet-flow-log"
flow_log_storage_account_name = "stdevuksflowlogs001"

network_watcher_name                = "NetworkWatcher_uksouth"
network_watcher_resource_group_name = "NetworkWatcherRG"

enable_defender_for_servers = true

hub_vnet_name     = "dev-hub-vnet"
hub_address_space = ["10.20.0.0/16"]


spoke_vnets = {
  spoke1 = {
    name                   = "dev-spoke1-vnet"
    address_space          = ["10.30.0.0/16"]
    workload_subnet_name   = "dev-spoke1-workload-subnet"
    workload_subnet_prefix = ["10.30.1.0/24"]
  }

  spoke2 = {
    name                   = "dev-spoke2-vnet"
    address_space          = ["10.40.0.0/16"]
    workload_subnet_name   = "dev-spoke2-workload-subnet"
    workload_subnet_prefix = ["10.40.1.0/24"]
  }
}

azure_firewall_subnet_prefix = ["10.20.1.0/26"]

firewall_name           = "dev-uks-azfw"
firewall_policy_name    = "dev-uks-azfw-policy"
firewall_public_ip_name = "dev-uks-azfw-pip"

east_west_routes = {
  spoke1_to_spoke2 = {
    source_spoke       = "spoke1"
    destination_prefix = "10.40.0.0/16"
    route_name         = "to-spoke2-via-firewall"
  }

  spoke2_to_spoke1 = {
    source_spoke       = "spoke2"
    destination_prefix = "10.30.0.0/16"
    route_name         = "to-spoke1-via-firewall"
  }

}

hybrid_routes = {
  spoke1_to_onprem = {
    source_spoke       = "spoke1"
    destination_prefix = "192.168.0.0/16"
    route_name         = "to-onprem-via-firewall"
  }

  spoke2_to_onprem = {
    source_spoke       = "spoke2"
    destination_prefix = "192.168.0.0/16"
    route_name         = "to-onprem-via-firewall"
  }
}

gateway_subnet_prefix = ["10.20.2.0/27"]

spoke_address_spaces = [
  "10.30.0.0/16",
  "10.40.0.0/16"
]

vpn_gateway_name           = "dev-uks-vpn-gw"
vpn_gateway_public_ip_name = "dev-uks-vpn-gw-pip"
vpn_gateway_sku            = "VpnGw1"

local_network_gateway_name = "dev-uks-onprem-lng"

onpremises_gateway_address = "203.0.113.10"

onpremises_address_spaces = [
  "192.168.0.0/16"
]
vpn_connection_name = "dev-uks-s2s-vpn-connection"

vm_name        = "dev-win-vm-01"
vm_size        = "Standard_B2s"
admin_username = "devadmin"