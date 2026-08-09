resource_group_name = "tf-dev-rg"

location = "uksouth"

environment = "dev"

route_tables = {

  web = {
    name                          = "dev-web-rt"
    bgp_route_propagation_enabled = true
    subnet_id                     = "/subscriptions/d28805e9-dd1d-40af-b97d-6e05ae66d34c/resourceGroups/tf-dev-rg/providers/Microsoft.Network/virtualNetworks/dev-uks-vnet/subnets/dev-web-subnet"

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
    subnet_id                     = "/subscriptions/d28805e9-dd1d-40af-b97d-6e05ae66d34c/resourceGroups/tf-dev-rg/providers/Microsoft.Network/virtualNetworks/dev-uks-vnet/subnets/dev-app-subnet"

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
    subnet_id                     = "/subscriptions/d28805e9-dd1d-40af-b97d-6e05ae66d34c/resourceGroups/tf-dev-rg/providers/Microsoft.Network/virtualNetworks/dev-uks-vnet/subnets/dev-mgmt-subnet"

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
  ManagedBy   = "Terraform"
  Project     = "Azure Cloud Security Consultant Portfolio"
}