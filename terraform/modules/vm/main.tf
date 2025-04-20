locals {
  nic_name     = "${var.vm}-nic"
  vm_public_ip = "${var.vm}-ip"
}

resource "azurerm_public_ip" "WebPublicIp" {
  name                = local.vm_public_ip
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

}


resource "azurerm_network_interface" "VmNic" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.web_app_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.WebPublicIp.id
  }
}

resource "azurerm_linux_virtual_machine" "chroma_vm" {
  name                = var.vm
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = var.adminUserName
  network_interface_ids = [
    azurerm_network_interface.VmNic.id,
  ]

  admin_ssh_key {
    username   = var.adminUserName
    public_key = file("${path.module}/../../ssh-keys/terraform-azure.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(file("${path.module}/../../scripts/init_script.sh"))
}
