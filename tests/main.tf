terraform {
  backend "azurerm" {
    resource_group_name  = "rg-azure-tf"
    storage_account_name = "saazuretf"
    container_name       = "terraform-state"
    key                  = "module-vnet-tests.tfstate"
  }
}

resource "random_string" "enigma" {
  length  = 6
  special = false
}

resource "azurerm_resource_group" "resource_group" {
 name = var.resource_group_name
 location = var.location
}

# Root Module Calling

module "vnet_testing" {
source = "../"
name = var.name
location = var.location
resource_group_name = var.resource_group
#depends_on = [azurerm_resource_group.resource_group]
}