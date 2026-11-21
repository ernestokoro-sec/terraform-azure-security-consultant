# --------------------------------------------------
# STAGE 01 - AZURE RESOURCE GROUP
# --------------------------------------------------

resource_group_name = "tf-dev-rg"
location            = "uksouth"

tags = {
  Environment = "dev"
  Project     = "terraform-azure"
  ManagedBy   = "Terraform"
}

# --------------------------------------------------
# STAGE 02 - AZURE VIRTUAL NETWORK
# --------------------------------------------------

vnet_name     = "dev-uks-vnet"
address_space = ["10.10.0.0/16"]

# --------------------------------------------------
# STAGE 03 - AZURE SUBNET CONFIGURATION
# --------------------------------------------------

subnets = {
  web = {
    name             = "dev-web-subnet"
    address_prefixes = ["10.10.1.0/24"]
  }

  app = {
    name             = "dev-app-subnet"
    address_prefixes = ["10.10.2.0/24"]
  }

  management = {
    name             = "dev-mgmt-subnet"
    address_prefixes = ["10.10.3.0/24"]
  }

  private_endpoint = {
    name             = "dev-pe-subnet"
    address_prefixes = ["10.10.4.0/24"]
  }
}

# --------------------------------------------------
# STAGE 04 - NETWORK SECURITY GROUP CONFIGURATION
# --------------------------------------------------

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