output "vm_id" {
  description = "Resource ID of the Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "principal_id" {
  description = "Principal ID of the VM System Assigned Managed Identity"
  value       = azurerm_windows_virtual_machine.vm.identity[0].principal_id
}