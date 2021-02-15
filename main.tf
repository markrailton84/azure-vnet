terraform {
  backend "azurerm" {
    resource_group_name  = "rg-azure-tf"
    storage_account_name = "saazuretf"
    container_name       = "terraform-state"
    key                  = "terraform-vnet.tfstate"
  }
}

resource "random_string" "enigma" {
  length  = 6
  special = false
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "${local.name}-ddos-${lower(random_string.enigma.result)}"
  location            = var.location
  resource_group_name = var.resourcegroup
  
  tags = {
    Environment = var.environment
    BuildBy     = var.tag_buildby
    BuildTicket = var.tag_buildticket
    BuildDate   = var.tag_builddate
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.name}-vnet-${lower(random_string.enigma.result)}"
  location            = var.location
  resource_group_name = var.resourcegroup
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.ddos.id
    enable = true
  }

  tags = {
    Environment = var.environment
    BuildBy     = var.tag_buildby
    BuildTicket = var.tag_buildticket
    BuildDate   = var.tag_builddate
  }
}

resource "azurerm_subnet" "sub1" {
  name                 = "${local.name}-sub1-${lower(random_string.enigma.result)}"
  resource_group_name  = var.resourcegroup
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  tags = {
  Environment = var.environment
  BuildBy     = var.tag_buildby
  BuildTicket = var.tag_buildticket
  BuildDate   = var.tag_builddate
  }
}

resource "azurerm_subnet" "sub2" {
  name                 = "${local.name}-sub2-${lower(random_string.enigma.result)}"
  resource_group_name  = var.resourcegroup
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  tags = {
  Environment = var.environment
  BuildBy     = var.tag_buildby
  BuildTicket = var.tag_buildticket
  BuildDate   = var.tag_builddate
  }
}

resource "azurerm_subnet" "sub3" {
  name                 = "${local.name}-sub3-${lower(random_string.enigma.result)}"
  resource_group_name  = var.resourcegroup
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]

  tags = {
  Environment = var.environment
  BuildBy     = var.tag_buildby
  BuildTicket = var.tag_buildticket
  BuildDate   = var.tag_builddate
  }
}