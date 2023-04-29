output "subnet_id" {
  value = azurerm_subnet.my_publicsubnets.*.id
}

output "vnet_id" {
  value = azurerm_virtual_network.my-vnet.id
}

output "vm_ip" {
  value = azurerm_public_ip.my_publicip.id
}
