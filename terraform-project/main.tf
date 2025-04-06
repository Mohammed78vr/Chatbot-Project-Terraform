resource "azurerm_resource_group" "myRg" {
  name     = var.resource_group_name
  location = var.location
}

module "Vnet" {
  source              = "./modules/Vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  VnetName            = var.VnetName
  subnetName          = var.subnetName
  nsg                 = var.nsg
  depends_on          = [azurerm_resource_group.myRg]
}

module "Vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.Vnet.subnet_id
  vmPublicIp          = var.vmPublicIp
  nic                 = var.nic
  vm                  = var.vm
  adminUserName       = var.adminUserName
  depends_on = [azurerm_resource_group.myRg,
  module.Vnet]
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  container           = var.container
  depends_on          = [azurerm_resource_group.myRg]
}

module "db" {
  source               = "./modules/db"
  resource_group_name  = var.resource_group_name
  location             = var.location
  database_server_name = var.database_server_name
  admin_db_username    = var.admin_db_username
  db_passowrd          = var.db_passowrd
  depends_on           = [azurerm_resource_group.myRg]
}
