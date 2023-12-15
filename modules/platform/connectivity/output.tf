output "vnet_hub_id" {
  value = azurerm_virtual_network.vnet_hub.id
}

output "vnet_hub_snet_id" {
  value = azurerm_subnet.vnet_hub_snet.id
}