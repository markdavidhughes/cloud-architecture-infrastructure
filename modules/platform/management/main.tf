resource "azurerm_resource_group" "management" {
  name     = var.management_resource_group_name
  location = var.location
}