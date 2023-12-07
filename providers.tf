terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  alias           = mct
  subscription_id = var.subscription_id
  features {}
}
