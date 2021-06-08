resource "azurerm_subnet" "public1" {
  name                 = "public1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefix       = var.public_subnet1_range
}

resource "azurerm_subnet" "public2" {
  name                 = "public2"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefix       = var.public_subnet2_range
}

resource "azurerm_subnet" "public3" {
  name                 = "public3"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefix       = var.public_subnet3_range
}