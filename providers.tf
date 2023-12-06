terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  alias           = "MSDN"
  subscription_id = "efe3ac6c-dce5-44b1-9e9f-0d995b980e93"
  features {}
}
