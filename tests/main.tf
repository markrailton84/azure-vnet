#terraform {
#  backend "azurerm" {
#    resource_group_name  = "rg-azure-tf"
#    storage_account_name = "saazuretf"
#    container_name       = "terraform-state"
#    key                  = "module-vnet-tests-new.tfstate"
#  }
#}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
 name = var.resource_group_name
 location = var.location
}

# Root Module Calling

module "vnet_testing" {
source = "../"
name = var.name
ddos_name = var.ddos_name
location = var.location
resource_group_name = var.resource_group_name
depends_on = [azurerm_resource_group.resource_group]
}