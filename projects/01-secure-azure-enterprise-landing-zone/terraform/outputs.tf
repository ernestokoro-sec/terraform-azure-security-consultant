output "azure_policy_definition_id" {
  description = "Resource ID of the custom Azure Policy definition"
  value       = module.azure_policy.policy_definition_id
}

output "azure_policy_assignment_id" {
  description = "Resource ID of the Azure Policy assignment"
  value       = module.azure_policy.policy_assignment_id
}


output "hub_vnet_id" {
  description = "Resource ID of the hub VNet"
  value       = module.hub_spoke_network.hub_vnet_id
}

output "spoke_vnet_ids" {
  description = "Resource IDs of the spoke VNets"
  value       = module.hub_spoke_network.spoke_vnet_ids
}