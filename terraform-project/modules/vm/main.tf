resource "azurerm_public_ip" "WebPublicIp" {
  name                = var.vmPublicIp
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

}


resource "azurerm_network_interface" "MyNic" {
  name                = var.nic
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.WebPublicIp.id
  }
}

resource "azurerm_linux_virtual_machine" "MyVm" {
  name                = var.vm
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = var.adminUserName
  network_interface_ids = [
    azurerm_network_interface.MyNic.id,
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
