data "azurerm_client_config" "current" {}
data "azurerm_subscription" "primary" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization   = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
  }

}

resource "azurerm_role_assignment" "key_vault_admin" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "key_vault_manged_identity" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.manged_identity_id
}

resource "azurerm_key_vault_secret" "database_name" {
  name         = "PROJ-DB-NAME"
  value        = var.database_name
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "database_username" {
  name         = "PROJ-DB-USER"
  value        = var.admin_db_username
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "database_password" {
  name         = "PROJ-DB-PASSWORD"
  value        = var.db_passowrd
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "database_host" {
  name         = "PROJ-DB-HOST"
  value        = var.database_host
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "database_port" {
  name         = "PROJ-DB-PORT"
  value        = "5432"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "OpenAi_key" {
  name         = "PROJ-OPENAI-API-KEY"
  value        = var.OpenAi_key
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "storage_SAS" {
  name         = "PROJ-AZURE-STORAGE-SAS-URL"
  value        = var.storage_SAS
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "storage_container_name" {
  name         = "PROJ-AZURE-STORAGE-CONTAINER"
  value        = var.container_name
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "chromadb_host" {
  name         = "PROJ-CHROMADB-HOST"
  value        = var.chroma_vm_private_ip_address
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "chromadb_port" {
  name         = "PROJ-CHROMADB-PORT"
  value        = "8000"
  key_vault_id = azurerm_key_vault.key_vault.id
}
