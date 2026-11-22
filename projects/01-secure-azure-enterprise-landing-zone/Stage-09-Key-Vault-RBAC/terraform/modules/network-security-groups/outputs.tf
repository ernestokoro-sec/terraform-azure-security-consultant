output "network_security_group_ids" {
  description = "Map of Network Security Group IDs."

  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    key => nsg.id
  }
}

output "network_security_group_names" {
  description = "Map of Network Security Group names."

  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    key => nsg.name
  }
}

output "security_rule_ids" {
  description = "Map of Network Security Rule IDs."

  value = {
    for key, rule in azurerm_network_security_rule.rule :
    key => rule.id
  }
}

output "subnet_association_ids" {
  description = "Map of subnet-to-NSG association IDs."

  value = {
    for key, association in azurerm_subnet_network_security_group_association.association :
    key => association.id
  }
}