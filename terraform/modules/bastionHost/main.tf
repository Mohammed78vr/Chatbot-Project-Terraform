resource "azurerm_public_ip" "bastion_host_ip" {
  name                = var.bastion_host_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.bastion_host_subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_host_ip.id
  }
}