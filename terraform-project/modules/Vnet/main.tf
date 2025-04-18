locals {
  network_security_group_name = "${var.vm}-nsg"
}

resource "azurerm_virtual_network" "MyVnet" {
  name                = var.Vnet_Name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "WebSubnet" {
  name                 = var.Web_app_subnet_Name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.MyVnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "ApplicationGateWaySubnet" {
  name                 = var.application_gateway_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.MyVnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_network_security_group" "VmNsg" {
  name                = local.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow-frontend"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8501"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                 = azurerm_subnet.WebSubnet.id
  network_security_group_id = azurerm_network_security_group.VmNsg.id
}
