# Create a network interface
resource "azurerm_network_interface" "my-nic" {
  name                = "my-nic"
  location            = azurerm_resource_group.my-rg.location
  resource_group_name = azurerm_resource_group.my-rg.name

  ip_configuration {
    name                          = "my-ip-config"
    subnet_id                     = azurerm_subnet.my_publicsubnets.0.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_publicip.id
  }



}

resource "azurerm_subnet_network_security_group_association" "my_subnet_nsg_ass" {
  subnet_id                 = azurerm_subnet.my_publicsubnets.0.id
  network_security_group_id = azurerm_network_security_group.my-nsg.id
}


# Create a virtual machine
resource "azurerm_virtual_machine" "my-VM" {
  name                  = "my-vm"
  location              = azurerm_resource_group.my-rg.location
  resource_group_name   = azurerm_resource_group.my-rg.name
  network_interface_ids = [azurerm_network_interface.my-nic.id]

  # Define the VM's configuration
  vm_size = "Standard_B2s"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "mndcdm-OSDisk"
    caching       = "ReadWrite"
    create_option = "FromImage"
    #managed_disk_id   = "/subscriptions/var.subscription_id/resourceGroups/<resource_group_name>/providers/Microsoft.Compute/disks/<disk_name>"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = 30
  }

  # Define the VM's login credentials
  os_profile {
    computer_name  = "my-vm"
    admin_username = "demo"
    admin_password = "India@123456789"
    # custom_data = <<-EOF
    #     #!/bin/bash
    #     sudo apt update
    #     sudo apt install -y nginx jq
    #     sudo git clone https://github.com/dvpsraj/dockertest1.git DevOps
    #     cd DevOps
    #     sudo cp index.html /var/www/html/index.nginx-debian.html
    #     sudo cp scorekeeper.js /var/www/html/scorekeeper.js
    #     sudo cp style.css /var/www/html/style.css
    #     sudo service nginx restart
    # EOF
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    CreatedBy = "Raj"
  }

  lifecycle {
    create_before_destroy = false
    prevent_destroy       = false
    ignore_changes = [
      tags,
    ]
  }

  depends_on = [
    azurerm_public_ip.my_publicip
  ]
}

##echo "<h1>Hello from user data</h1>" | sudo tee /var/www/html/index.nginx-debian.html