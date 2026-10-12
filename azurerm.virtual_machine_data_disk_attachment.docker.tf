resource "azurerm_virtual_machine_data_disk_attachment" "docker" {
  managed_disk_id    = azurerm_managed_disk.docker.id
  virtual_machine_id = azurerm_linux_virtual_machine.web.id
  lun                = 0
  caching            = "ReadWrite"
}

