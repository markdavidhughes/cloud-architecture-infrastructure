resource "azurerm_resource_group" "connectivity" {
  name     = "rg-ca-connectivity-01"
  location = var.location
}