resource "azurerm_managed_disk" "docker" {
  name                 = "disk-docker-${var.name_suffix}"
  location             = azurerm_resource_group.lab.location
  resource_group_name  = azurerm_resource_group.lab.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.docker_data_disk_size_gb

  tags = {
    environment = "lab"
    project     = "cloud-init-minikube-hello"
    purpose     = "docker-minikube-data"
  }
}

