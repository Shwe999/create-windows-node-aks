terraform {
  backend "azurerm" {
    resource_group_name = "RGfortfstate"
    storage_account_name = "safortfstate123"
    container_name = "containerfortfstate"
    key = "terraform.tfstate"
  }
}