# --------------------------------------------------
# STAGE 01 - AZURE RESOURCE GROUP
# --------------------------------------------------

output "resource_group_id" {
  description = "Azure Resource ID of the Resource Group."
  value       = module.resource_group.resource_group_id
}

output "resource_group_name" {
  description = "Name of the Resource Group."
  value       = module.resource_group.resource_group_name
}


# --------------------------------------------------
# STAGE 02 - AZURE VIRTUAL NETWORK DEPLOYMENT
# -------------------------------------------------

output "virtual_network_id" {
  description = "Azure Resource ID of the Virtual Network."
  value       = module.network.virtual_network_id
}

output "virtual_network_name" {
  description = "Name of the Virtual Network."
  value       = module.network.virtual_network_name
}

output "address_space" {
  description = "Address space assigned to the Virtual Network."
  value       = module.network.address_space
}


# --------------------------------------------------
# STAGE 03 - AZURE SUBNET OUTPUTS
# --------------------------------------------------

output "subnet_ids" {
  description = "Map of deployed subnet IDs."
  value       = module.subnets.subnet_ids
}

output "subnet_names" {
  description = "Map of deployed subnet names."
  value       = module.subnets.subnet_names
}