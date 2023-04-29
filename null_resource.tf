resource "null_resource" "execute-file-script" {
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type     = "ssh"
      user     = "demo"
      password = var.root_password
      host     = azurerm_public_ip.my_publicip.ip_address
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
    connection {
      type     = "ssh"
      user     = "demo"
      password = var.root_password
      host     = azurerm_public_ip.my_publicip.ip_address
    }
  }
  provisioner "local-exec" {
    command = <<EOH
      echo "${azurerm_public_ip.my_publicip.ip_address}" >> public_ip.txt
    EOH
  }
}