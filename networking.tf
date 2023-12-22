resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name
  address_space       = var.vnet_cidr
  tags                = var.resource_tags
}

resource "azurerm_subnet" "this" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value
  service_endpoints    = each.key == var.public_subnet_name ? var.service_endpoint : null
}

resource "azurerm_public_ip" "vm-ip" {
  name                = var.pub_ip_name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = var.location
  allocation_method   = var.ip_allocation
  lifecycle {
    create_before_destroy = true
  }
  tags = var.resource_tags
}

resource "azurerm_network_security_group" "subnet2" {
  name                = var.sg_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name

  security_rule {
    name                       = var.sg_rule_name
    priority                   = var.sg_rule_priority
    direction                  = var.sg_rule_direction
    access                     = var.sg_access_rule
    protocol                   = var.sg_rule_protocol
    source_port_range          = var.sg_source_port
    destination_port_range     = var.sg_destination_port
    source_address_prefix      = var.source_addres
    destination_address_prefix = var.destination_address
  }
  tags = var.resource_tags
}

resource "azurerm_subnet_network_security_group_association" "subnet_sg" {
  subnet_id                 = azurerm_subnet.this[var.public_subnet_name].id
  network_security_group_id = azurerm_network_security_group.subnet2.id
}