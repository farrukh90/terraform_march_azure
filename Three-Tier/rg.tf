provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "dev" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
