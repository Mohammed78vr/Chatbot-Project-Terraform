subscription_id     = "0f1c51b7-70da-4b6a-9c32-9ef1d99a945a" #use your subsctiption Id
resource_group_name = "terraSDA"
location            = "norwayeast"
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
end_ip_address       = "255.255.255.255"
#======================= varibales for VMSS modules =======================
vmss_name       = "AppVMSS"
source_image_id = "/subscriptions/0f1c51b7-70da-4b6a-9c32-9ef1d99a945a/resourceGroups/MilestoneDemoRG/providers/Microsoft.Compute/galleries/ChatbotGallery/images/chatbot-image" # use your image for the VMSS
#======================= varibales for Application gateway modules =======================
appliaction_gateway_public_ip_name = "appGateway-ip"
application_gateway_name           = "appgateway"
#======================= varibales for Key vaults modules =======================
key_vault_name = "keyvaultsda984"
openai_key     = "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"
#======================= varibales for bastion host modules =======================
bastion_host_name           = "bastionHost"
bastion_host_public_ip_name = "bastion-ip"
