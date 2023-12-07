resource "azurerm_resource_group" "connectivity" {
  name     = var.connectivityname
  location = var.location
}

#resource "azurerm_virtual_network" "vnet-hub" {
#  name                = "vnet-ca-hub-01"
#  location            = var.location
#  resource_group_name = azurerm_resource_group.connectivity.name
#  address_space       = [var.vnet-hub-address-space]
 # dns_servers         = ["10.10.1.4", "168.63.129.16", "8.8.8.8"]
#}

#resource "azurerm_subnet" "vnet-hub-snet" {
#  name                = "snet-${var.short-company-name}-hub-01"
#  resource_group_name = azurerm_resource_group.connectivity.name
#  virtual_network_name = azurerm_virtual_network.vnet-hub.name
#  address_prefixes =     [var.vnet-hub-snet-range]
#}

#data "http" "clientip" {
#  url = "https://ipv4.icanhazip.com/"
#}

#resource "azurerm_network_security_group" "nsg" {
#  name                = "nsg-${var.short-company-name}-hub-01"
 # location            = var.location
##  resource_group_name = azurerm_resource_group.connectivity.name

 # security_rule {
 #   name                       = "RDP-In"
 #   priority                   = 100
 #   direction                  = "Inbound"
 #   access                     = "Allow"
 #   protocol                   = "*"
 #   source_port_range          = "*"
  #  destination_port_range     = "3389"
 #   source_address_prefix      = "${chomp(data.http.clientip.body)}/32"
 #   destination_address_prefix = "*"
 # }
#}

#resource "azurerm_subnet_network_security_group_association" "vnet-hub" {
#  subnet_id                 = azurerm_subnet.vnet-hub-snet.id
#  network_security_group_id = azurerm_network_security_group.nsg.id
#}