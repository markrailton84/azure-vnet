resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = var.ddos_name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  tags = {
    Environment = var.environment
    BuildBy     = var.tag_buildby
    BuildTicket = var.tag_buildticket
    BuildDate   = var.tag_builddate
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
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