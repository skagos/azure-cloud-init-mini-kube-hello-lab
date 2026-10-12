resource "azurerm_virtual_network" "lab" {
  name                = "vnet-cloudinit-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  address_space       = ["10.40.0.0/16"]
}

