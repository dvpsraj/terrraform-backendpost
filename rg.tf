# Create a resource group
resource "azurerm_resource_group" "my-rg" {
  name     = var.rg_name
  location = var.location
}