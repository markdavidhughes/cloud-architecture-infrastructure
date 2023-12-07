terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  alias           = var.alias
  subscription_id = var.subscription_id
  features {}
}
