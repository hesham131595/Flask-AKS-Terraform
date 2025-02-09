terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.17.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "backendtfstatestorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}
