resource "azurerm_resource_group" "identity" {
  name     = var.identity_resource_group_name
  location = var.location
}

resource "azurerm_windows_virtual_machine" "windows_vm_domaincontroller" {
  name  = "vm-dc-01"
  location              = azurerm_resource_group.identity.location
  resource_group_name   = var.identity_resource_group_name
  network_interface_ids = [azurerm_network_interface.dc_nic.id]
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"
  admin_password        = "P@ssw0rd123!!!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}

resource "azurerm_network_interface" "dc_nic" {
  
  name = "nic-dc-01"
  location              = azurerm_resource_group.identity.location
  resource_group_name   = var.identity_resource_group_name
 

  ip_configuration {
    name      = "internal"
    subnet_id = var.vnet_hub_snet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
  }
}