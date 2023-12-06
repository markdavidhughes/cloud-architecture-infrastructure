module "connectivity" {
  source = "./modules/platform/connectivity"
  providers = {
    azurerm = azurerm.MSDN
  }
  location         = var.location
  connectivityname = var.connectivityname
}

module "identity" {
  source = "./modules/platform/identity"
  providers = {
    azurerm = azurerm.MSDN
  }
  location     = var.location
  identityname = var.identityname
}

module "management" {
  source = "./modules/platform/management"
  providers = {
    azurerm = azurerm.MSDN
  }
  location       = var.location
  managementname = var.managementname
}
