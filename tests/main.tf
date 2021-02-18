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
 name = "${local.name}-rsg-${lower(random_string.enigma.result)}"
 location = var.location
}

# Root Module Calling

module "vnet_testing" {
source = "../"
name = "${local.name}-vnet-${lower(random_string.enigma.result)}"
location = var.location
resource_group_name = var.resource_group
depends_on = [azurerm_resource_group.resource_group]
}