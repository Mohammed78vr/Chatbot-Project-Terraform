resource "azurerm_resource_group" "myRg" {
  name     = var.resource_group_name
  location = var.location
}

module "Vnet" {
  source                          = "./modules/Vnet"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  Vnet_Name                       = var.Vnet_Name
  Web_app_subnet_Name             = var.Web_app_subnet_Name
  application_gateway_subnet_name = var.application_gateway_subnet_name
  vm                              = var.vm
  depends_on                      = [azurerm_resource_group.myRg]
}

module "Vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  web_app_subnet_id   = module.Vnet.web_app_subnet_id
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
  database_name        = var.database_name
  start_ip_address     = var.start_ip_address
  end_ip_address       = var.end_ip_address
  depends_on           = [azurerm_resource_group.myRg]
}

module "vmss" {
  source              = "./modules/vmss"
  resource_group_name = var.resource_group_name
  location            = var.location
  vmss_name           = var.vmss_name
  source_image_id     = var.source_image_id
  subnet_id           = module.Vnet.web_app_subnet_id
  backend_pool_id     = module.application_gateway.backend_pool_id
  depends_on = [azurerm_resource_group.myRg,
  module.Vnet]
}

module "application_gateway" {
  source                             = "./modules/applicationGateway"
  resource_group_name                = var.resource_group_name
  location                           = var.location
  appliaction_gateway_public_ip_name = var.appliaction_gateway_public_ip_name
  application_gateway_name           = var.application_gateway_name
  VnetName                           = module.Vnet.Vnet_name
  application_gateway_subnet_id      = module.Vnet.application_gateway_subnet_id
  depends_on                         = [azurerm_resource_group.myRg, module.Vnet]
}

module "key_vault" {
  source                       = "./modules/keyVaults"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  key_vault_name               = var.key_vault_name
  manged_identity_id           = module.vmss.vmss_managed_identity
  database_host                = module.db.database_host
  database_name                = var.database_name
  admin_db_username            = var.admin_db_username
  db_passowrd                  = var.db_passowrd
  storage_SAS                  = module.storage.storage_SAS
  container_name               = var.container
  chroma_vm_private_ip_address = module.Vm.vm_private_ip_address
  OpenAi_key                   = var.openai_key
  depends_on                   = [azurerm_resource_group.myRg, module.vmss]
}

module "bastion" {
  source                      = "./modules/bastionHost"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  bastion_host_name           = var.bastion_host_name
  bastion_host_public_ip_name = var.bastion_host_public_ip_name
  bastion_host_subnet_id      = module.Vnet.bastion_host_subnet_id
  depends_on                  = [azurerm_resource_group.myRg]
}
