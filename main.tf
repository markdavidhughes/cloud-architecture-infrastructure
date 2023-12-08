module "connectivity" {
  source = "./modules/platform/connectivity"
  providers = {
    azurerm = azurerm.MSDN
  }
  location                         = var.location
  connectivity_resource_group_name = var.connectivity_resource_group_name
  vnet_hub_name                    = var.vnet_hub_name
  vnet_hub_address_space           = var.vnet_hub_address_space
  vnet_hub_dns_space               = var.vnet_hub_dns_space
  vnet_hub_snet_name               = var.vnet_hub_snet_name
  vnet_hub_snet_range              = var.vnet_hub_snet_range
  nsg_name                         = var.nsg_name
  nsg_security_rule_rdp_name       = var.nsg_security_rule_rdp_name
}

module "identity" {
  source = "./modules/platform/identity"
  providers = {
    azurerm = azurerm.MSDN
  }
  location                     = var.location
  identity_resource_group_name = var.identity_resource_group_name
}

module "management" {
  source = "./modules/platform/management"
  providers = {
    azurerm = azurerm.MSDN
  }
  location                       = var.location
  management_resource_group_name = var.management_resource_group_name
}
