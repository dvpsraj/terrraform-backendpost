
# Create a subnet1 within the vnet and rg
resource "azurerm_subnet" "my_publicsubnets" {
  count                = length(var.public_subnet_cidr)
  name                 = element(var.public_subnet_name, count.index)
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [element(var.public_subnet_cidr, count.index)]
  depends_on = [
    azurerm_resource_group.my-rg,
    azurerm_virtual_network.my-vnet
  ]
}