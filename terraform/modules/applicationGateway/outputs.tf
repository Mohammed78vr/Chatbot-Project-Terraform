output "backend_pool_id" {
  value = tolist(azurerm_application_gateway.AppGatewayR.backend_address_pool)[0].id
}

output "application_gateway_public_ip_address" {
  value = azurerm_public_ip.Application_Gateway_Public_IP.ip_address
}
