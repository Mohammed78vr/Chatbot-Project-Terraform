output "vm" {
  value = azurerm_linux_virtual_machine.MyVm.public_ip_address
}