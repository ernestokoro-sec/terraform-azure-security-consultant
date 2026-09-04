resource "azurerm_public_ip" "firewall" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_firewall_policy" "firewall" {
  name                = var.firewall_policy_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  tags = var.tags
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  firewall_policy_id = azurerm_firewall_policy.firewall.id

  ip_configuration {
    name                 = "firewall-ip-configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }

  tags = var.tags
}

resource "azurerm_firewall_policy_rule_collection_group" "main" {
  name               = "default-rule-collection-group"
  firewall_policy_id = azurerm_firewall_policy.firewall.id
  priority           = 100

  network_rule_collection {
    name     = "allow-east-west"
    priority = 100
    action   = "Allow"

    rule {
      name                  = "allow-spoke-to-spoke"
      protocols             = ["Any"]
      source_addresses      = var.spoke_address_spaces
      destination_addresses = var.spoke_address_spaces
      destination_ports     = ["*"]
    }
    rule {
      name                  = "allow-spoke-to-onprem"
      protocols             = ["Any"]
      source_addresses      = var.spoke_address_spaces
      destination_addresses = var.onpremises_address_spaces
      destination_ports     = ["*"]
    }

    rule {
      name                  = "allow-onprem-to-spoke"
      protocols             = ["Any"]
      source_addresses      = var.onpremises_address_spaces
      destination_addresses = var.spoke_address_spaces
      destination_ports     = ["*"]
    }
  }

  application_rule_collection {
    name     = "allow-web"
    priority = 200
    action   = "Allow"

    rule {
      name = "allow-web-access"

      protocols {
        type = "Http"
        port = 80
      }

      protocols {
        type = "Https"
        port = 443
      }

      source_addresses = var.spoke_address_spaces

      destination_fqdns = [
        "*"
      ]
    }
  }
}