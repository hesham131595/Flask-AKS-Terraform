output "vnet_name" {
  value       = azurerm_virtual_network.aks_net.name
}

output "subnet_id" {
  value       = azurerm_subnet.aks_subnet.id
}
