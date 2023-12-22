#Azure Storage account
resource "azurerm_storage_account" "files" {
  name                     = var.storage_name
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = var.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_replication
  network_rules {
    default_action             = var.storage_default_action
    ip_rules                   = var.storage_ip_rules
    virtual_network_subnet_ids = [azurerm_subnet.this[var.public_subnet_name].id]
  }
  tags = var.resource_tags
}

# resource "azurerm_storage_container" "files" {
#   name                  = var.container_name
#   storage_account_name  = azurerm_storage_account.files.name
#   container_access_type = var.container_access
# }