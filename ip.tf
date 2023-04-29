# Create a public IP address
resource "azurerm_public_ip" "my_publicip" {
  name                = "my-public-ip"
  location            = azurerm_resource_group.my-rg.location
  resource_group_name = azurerm_resource_group.my-rg.name
  allocation_method   = "Static"
}