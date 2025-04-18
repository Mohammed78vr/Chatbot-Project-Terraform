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
