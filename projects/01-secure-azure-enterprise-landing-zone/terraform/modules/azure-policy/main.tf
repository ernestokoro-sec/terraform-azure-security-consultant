resource "azurerm_policy_definition" "required_environment_tag" {
  name         = "require-environment-tag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Audit resources missing Environment tag"

  metadata = jsonencode({
    category = "Governance"
  })

  policy_rule = jsonencode({
    if = {
      field  = "tags['Environment']"
      exists = "false"
    }

    then = {
      effect = "audit"
    }
  })
}

resource "azurerm_subscription_policy_assignment" "required_environment_tag" {
  name                 = "audit-missing-environment-tag"
  display_name         = "Audit resources missing Environment tag"
  policy_definition_id = azurerm_policy_definition.required_environment_tag.id
  subscription_id      = var.policy_assignment_scope
}