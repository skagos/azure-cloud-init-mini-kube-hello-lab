resource "azurerm_linux_virtual_machine" "web" {
  name                = "vm-cloudinit-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  size                = var.vm_size
  admin_username      = var.admin_username

  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.vm.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  os_disk {
    name                 = "osdisk-cloudinit-${var.name_suffix}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  custom_data = base64encode(templatefile("${path.module}/cloud-init.yaml", {
    hello_message  = var.hello_message
    admin_username = var.admin_username
  }))

  depends_on = [azurerm_subnet_network_security_group_association.web]

  boot_diagnostics {}

  tags = {
    environment = "lab"
    project     = "cloud-init-docker-hello"
  }
}
