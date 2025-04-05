resource "azurerm_resource_group" "myRg" {
  name     = var.resource_group_name
  location = var.location
}

module "Vnet" {
  source              = "./modules/Vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "Vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.Vnet.subnet_id
}
