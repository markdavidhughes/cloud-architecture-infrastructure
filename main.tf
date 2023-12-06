module "connectivity" {
  source = "./modules/platform/connectivity"
  providers = {
    azurerm = azurerm.MSDN
  }
  location = var.location
  connectivityname = var.connectivityname
}