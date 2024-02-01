resource "azurerm_linux_virtual_machine" "vmsblock" {
  for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.nicdata[each.key].id]
  disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

connection {
  host = self.public_ip_address
  user = self.admin_username
  password = self.admin_password
  type = "ssh"
  timeout = "4m"
}
# provisioner "file" {
#   source = "index.html"
#   destination = "/tmp/index.html"

# }

# provisioner "remote-exec" {
# inline = ["sudo apt update","sudo apt install nginx -y","sudo cp /tmp/index.html /var/wwww/html"]
# }

# provisioner "local-exec" {
# command = "echo completed > done.txt"
# }

}

data "azurerm_network_interface" "nicdata" {
  for_each = var.vms
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}

