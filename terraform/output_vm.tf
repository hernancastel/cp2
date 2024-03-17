#Variables de output VM

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
  #sensitive = true
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.virtualMachine.id
}

output "virtual_network_id" {
  value = azurerm_virtual_network.virtualNetwork.id
}

output "vm_public_ip_adress" {
  value = azurerm_linux_virtual_machine.virtualMachine.public_ip_address
}