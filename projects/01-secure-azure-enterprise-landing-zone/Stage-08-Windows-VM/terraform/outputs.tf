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

# --------------------------------------------------
# STAGE 04 - NETWORK SECURITY GROUP OUTPUTS
# --------------------------------------------------

output "network_security_group_ids" {
  description = "Map of NSG resource IDs."
  value       = module.network_security_groups.network_security_group_ids
}

output "network_security_group_names" {
  description = "Map of NSG names."
  value       = module.network_security_groups.network_security_group_names
}

output "security_rule_ids" {
  description = "Map of NSG security rule IDs."
  value       = module.network_security_groups.security_rule_ids
}

output "subnet_association_ids" {
  description = "Map of subnet-to-NSG association IDs."
  value       = module.network_security_groups.subnet_association_ids
}

# --------------------------------------------------
# STAGE 05 - ROUTE TABLE OUTPUTS
# --------------------------------------------------

output "route_table_ids" {
  description = "Map of Azure Route Table resource IDs."
  value       = module.route_tables.route_table_ids
}

output "route_table_names" {
  description = "Map of Azure Route Table names."
  value       = module.route_tables.route_table_names
}

output "route_ids" {
  description = "Map of user-defined route resource IDs."
  value       = module.route_tables.route_ids
}

output "route_table_subnet_association_ids" {
  description = "Map of route table subnet association IDs."
  value       = module.route_tables.subnet_association_ids
}


# --------------------------------------------------
# STAGE 06 - NETWORK INTERFACE OUTPUTS
# --------------------------------------------------

output "network_interface_id" {
  description = "Resource ID of the management Network Interface"
  value       = module.network_interface.network_interface_id
}

output "network_interface_private_ip" {
  description = "Private IP address assigned to the management NIC"
  value       = module.network_interface.private_ip_address
}

# --------------------------------------------------
# STAGE 07 - BASTION HOST OUTPUTS
# --------------------------------------------------

output "bastion_id" {
  description = "Resource ID of the Azure Bastion host"
  value       = module.bastion.bastion_id
}

output "bastion_public_ip_address" {
  description = "Public IP address assigned to Azure Bastion"
  value       = module.bastion.public_ip_address
}


# --------------------------------------------------
# STAGE 08 - WINDOWS VIRTUAL MACHINE OUTPUTS
# --------------------------------------------------

output "windows_vm_id" {
  description = "Resource ID of the Windows management Virtual Machine"
  value       = module.windows_vm.vm_id
}

output "windows_vm_principal_id" {
  description = "Principal ID of the Windows VM system-assigned managed identity"
  value       = module.windows_vm.principal_id
}