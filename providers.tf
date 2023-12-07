terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  alias           = "MSDN"
  subscription_id = var.subscription_id
  features {}
}
