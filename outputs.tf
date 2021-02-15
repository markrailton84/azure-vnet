output "azurerm_virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}

output "azurerm_virtual_network_name" {
  value = azurerm_virtual_network.vnet.vnet.name
}

output "azurerm_subnet_id_1" {
  value = azurerm_subnet.sub1.id
}

output "azurerm_subnet_id_2" {
  value = azurerm_subnet.sub2.id
}

output "azurerm_subnet_id_3" {
  value = azurerm_subnet.sub3.id
}

output "azurerm_subnet_name_1" {
  value = azurerm_subnet.sub1.name
}

output "azurerm_subnet_name_2" {
  value = azurerm_subnet.sub2.name
}

output "azurerm_subnet_name_3" {
  value = azurerm_subnet.sub3.name
}
