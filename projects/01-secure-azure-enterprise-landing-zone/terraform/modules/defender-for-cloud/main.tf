resource "azurerm_security_center_subscription_pricing" "servers" {
  count = var.enable_defender_for_servers ? 1 : 0

  tier          = "Standard"
  resource_type = "VirtualMachines"
  subplan       = "P2"
}