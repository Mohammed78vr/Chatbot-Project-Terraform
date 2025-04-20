output "vmss_managed_identity" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.identity.0.principal_id
}