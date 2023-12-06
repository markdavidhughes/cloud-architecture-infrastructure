resource "azurerm_resource_group" "management" {
  name     = var.managementname
  location = var.location
}