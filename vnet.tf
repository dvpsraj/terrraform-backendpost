# Create a virtual network within the resource group
resource "azurerm_virtual_network" "my-vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = var.vnet_cidr
  depends_on = [
    azurerm_resource_group.my-rg
  ]
}