output "storage_SAS" {
  value = "${azurerm_storage_account.stgaccount.primary_blob_endpoint}${azurerm_storage_container.blob.name}${data.azurerm_storage_account_sas.storage_SAS.sas}"
}
