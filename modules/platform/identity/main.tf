resource "azurerm_resource_group" "identity" {
  name     = var.identityname
  location = var.location
}