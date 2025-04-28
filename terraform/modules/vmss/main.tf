resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_B1s"
  instances           = 2
  admin_username      = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/../../ssh-keys/terraform-azure-vmss.pub")
  }

  source_image_id = var.source_image_id

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "network_interface"
    primary = true

    ip_configuration {
      name                                         = "internal-primary"
      primary                                      = true
      subnet_id                                    = var.subnet_id
      application_gateway_backend_address_pool_ids = [var.backend_pool_id]
    }
  }
  custom_data         = base64encode(file("${path.module}/../../scripts/init_script_vmss.sh"))
  secure_boot_enabled = true

  upgrade_mode = "Automatic"

  identity {
    type = "SystemAssigned"
  }
}
