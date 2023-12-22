resource "azurerm_network_interface" "this" {
  for_each            = var.network_interface
  name                = each.key
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name

  ip_configuration {
    name                          = "${each.key}-vm"
    subnet_id                     = azurerm_subnet.this[each.value].id
    private_ip_address_allocation = var.ip_allocation
    public_ip_address_id          = each.key == var.public_nic ? azurerm_public_ip.vm-ip.id : null
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "linux-${var.vm_name}"
  resource_group_name             = data.azurerm_resource_group.this.name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.vm_username
  admin_password                  = var.vm_password
  user_data                       = filebase64("${path.module}/scripts/script.sh")
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.this[var.linux_nic].id,
  ]


  os_disk {
    caching              = var.os_disk_cache
    storage_account_type = var.os_disk_storage
  }

  source_image_reference {
    publisher = var.linux_image_publisher
    offer     = var.linux_image_offer
    sku       = var.linux_image_sku
    version   = var.linux_image_version
  }
}
