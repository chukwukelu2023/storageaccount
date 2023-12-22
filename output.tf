output "connection_string" {
  value     = azurerm_storage_account.files.primary_connection_string
  sensitive = true
}

output "acces_key" {
  value     = azurerm_storage_account.files.primary_access_key
  sensitive = true
}

output "linux_vm" {
  value = azurerm_linux_virtual_machine.vm1.public_ip_address
}
