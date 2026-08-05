terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnet" {

  name                = var.vnet_name

  location            = var.location

  resource_group_name = var.resource_group_name

  address_space       = var.address_space

  tags                = var.tags
}
