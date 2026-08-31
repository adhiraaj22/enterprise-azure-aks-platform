terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dev-tfstate-001"
    storage_account_name = "stpracticedevtfstate001"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}