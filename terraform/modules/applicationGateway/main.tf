# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "VMSSBackendPool"
  frontend_port_name             = "${var.VnetName}-feport"
  frontend_ip_configuration_name = "${var.VnetName}-feip"
  http_setting_name              = "${var.VnetName}-be-htst"
  listener_name                  = "${var.VnetName}-httplstn"
  request_routing_rule_name      = "${var.VnetName}-rqrt"
  redirect_configuration_name    = "${var.VnetName}-rdrcfg"
}

resource "azurerm_public_ip" "Application_Gateway_Public_IP" {
  name                = var.appliaction_gateway_public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

}

resource "azurerm_application_gateway" "AppGatewayR" {
  name                = var.application_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name = "Standard_v2"
    tier = "Standard_v2"
  }
  autoscale_configuration {
    min_capacity = 1
    max_capacity = 2 # Max 125 for Standard_v2 SKU
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = var.application_gateway_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.Application_Gateway_Public_IP.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 8501
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}
