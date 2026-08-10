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

  allow-rdp = {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "90.204.93.5/32"
    destination_address_prefix = "*"
    nsg_key                    = "mgmt"
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

vm_name        = "dev-win-vm-01"
vm_size        = "Standard_B2s"
admin_username = "devadmin"