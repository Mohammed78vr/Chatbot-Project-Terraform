output "web_app_subnet_id" {
  value = azurerm_subnet.WebSubnet.id
}

output "Vnet_name" {
  value = azurerm_virtual_network.MyVnet.name
}

output "application_gateway_subnet_id" {
  value = azurerm_subnet.ApplicationGateWaySubnet.id
}

output "bastion_host_subnet_id" {
  value = azurerm_subnet.bastion_host_subnet.id
}
