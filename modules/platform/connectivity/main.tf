resource "azurerm_resource_group" "connectivity" {
  name     = var.connectivity_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet_hub" {
  name                = var.vnet_hub_name
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name
  address_space       = var.vnet_hub_address_space
  dns_servers         = var.vnet_hub_dns_space
}

resource "azurerm_subnet" "vnet_hub_snet" {
  name                 = var.vnet_hub_snet_name
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = azurerm_virtual_network.vnet_hub.name
  address_prefixes     = var.vnet_hub_snet_range
}

data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name

  security_rule {
    name                       = var.nsg_security_rule_rdp_name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "${chomp(data.http.clientip.body)}/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "vnet-hub" {
  subnet_id                 = azurerm_subnet.vnet_hub_snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
