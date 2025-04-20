output "vm" {
  value = azurerm_linux_virtual_machine.chroma_vm.public_ip_address
}

output "vm_private_ip_address" {
  value = azurerm_linux_virtual_machine.chroma_vm.private_ip_address
}