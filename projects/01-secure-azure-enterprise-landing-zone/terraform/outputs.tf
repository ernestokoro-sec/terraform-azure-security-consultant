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

output "spoke_workload_subnet_ids" {
  description = "Resource IDs of the workload subnets in the spoke VNets"
  value       = module.hub_spoke_network.spoke_workload_subnet_ids
}

output "azure_firewall_private_ip" {
  description = "Private IP address of the Azure Firewall"
  value       = module.azure_firewall.firewall_private_ip
}

output "azure_firewall_public_ip" {
  description = "Public IP address of the Azure Firewall"
  value       = module.azure_firewall.firewall_public_ip
}

output "spoke_route_table_ids" {
  description = "Resource IDs of the spoke route tables"
  value       = module.spoke_routing.spoke_route_table_ids
}