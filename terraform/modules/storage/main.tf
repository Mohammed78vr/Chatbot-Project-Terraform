# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    resource_group = var.resource_group_name
  }
  byte_length = 4
}
# Creating a Storage Account
resource "azurerm_storage_account" "stgaccount" {
  name                     = "store${random_id.random_id.hex}" # The name must be globally unique
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
# Creating a storage container
resource "azurerm_storage_container" "blob" {
  name                  = var.container
  storage_account_id    = azurerm_storage_account.stgaccount.id
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "storage_SAS" {
  connection_string = azurerm_storage_account.stgaccount.primary_connection_string
  https_only        = true
  signed_version    = "2022-11-02"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2025-04-28T00:00:00Z"
  expiry = "2025-06-21T00:00:00Z"

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = false
    process = false
    tag     = true
    filter  = true
  }
}
