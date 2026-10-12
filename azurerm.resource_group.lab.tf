resource "azurerm_resource_group" "lab" {
  name     = "rg-cloudinit-docker-${var.name_suffix}"
  location = var.location
  tags = {
    environment = "lab"
    project     = "cloud-init-docker-hello"
  }
}

