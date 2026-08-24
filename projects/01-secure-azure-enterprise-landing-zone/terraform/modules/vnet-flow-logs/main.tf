data "azurerm_network_watcher" "network_watcher" {
  name                = var.network_watcher_name
  resource_group_name = var.network_watcher_resource_group_name
}

resource "azurerm_storage_account" "flow_logs" {
  name                     = var.flow_log_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"

  public_network_access_enabled   = true
  allow_nested_items_to_be_public = false

  network_rules {
    default_action = "Deny"

    bypass = [
      "AzureServices"
    ]
  }

  tags = var.tags
}

resource "azurerm_network_watcher_flow_log" "vnet_flow_log" {
  name = var.flow_log_name

  network_watcher_name = data.azurerm_network_watcher.network_watcher.name

  resource_group_name = var.network_watcher_resource_group_name

  target_resource_id = var.virtual_network_id
  storage_account_id = azurerm_storage_account.flow_logs.id

  enabled = true
  version = 2

  retention_policy {
    enabled = true
    days    = var.retention_days
  }

  traffic_analytics {
    enabled = true

    workspace_id          = var.log_analytics_workspace_guid
    workspace_region      = var.log_analytics_workspace_region
    workspace_resource_id = var.log_analytics_workspace_id

    interval_in_minutes = 10
  }

  tags = var.tags
}