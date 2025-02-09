resource "azurerm_virtual_network" "aks_net" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  virtual_network_name = azurerm_virtual_network.aks_net.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.address_prefixes
}