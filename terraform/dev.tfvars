subscription_id     = "<YOUR_SUBSCRIPTION_ID>" #use your subsctiption Id
resource_group_name = "terraSDA"
location            = "canadacentral"
#======================= varibales for Vnet modules =======================
Vnet_Name                       = "WebVnet"
Web_app_subnet_Name             = "WebAppSubnet"
application_gateway_subnet_name = "applicationGatewaySubnet"
#======================= varibales for VM modules =======================
vm            = "chromavm"
adminUserName = "azureuser"
#======================= varibales for storage modules =======================
container = "chat-history"
#======================= varibales for db modules =======================
database_server_name = "postgresqldbdd"
database_name        = "chatbotdb"
admin_db_username    = "azureadmin"
db_passowrd          = "Weclouddata1"
start_ip_address     = "0.0.0.0"
end_ip_address       = "0.0.0.0"
#======================= varibales for VMSS modules =======================
vmss_name       = "AppVMSS"
source_image_id = "<YOUR_IMAGE_ID>" # use your image for the VMSS
#======================= varibales for Application gateway modules =======================
appliaction_gateway_public_ip_name = "appGateway-ip"
application_gateway_name           = "appgateway"
#======================= varibales for Key vaults modules =======================
key_vault_name = "keysda984"
openai_key     = "<YOUR_OPENAI_KEY>"
#======================= varibales for bastion host modules =======================
bastion_host_name           = "bastionHost"
bastion_host_public_ip_name = "bastion-ip"
