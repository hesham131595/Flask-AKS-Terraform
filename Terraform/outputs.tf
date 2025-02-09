# Resource Group Outputs
output "location" {
  value = azurerm_resource_group.aks_rg.location
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}

# AKS Outputs

output "current_version" {
  value = module.aks.aks_cluster_kubernetes_version
}

output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

# Network Outputs

output "vnet_name" {
  value = module.network.vnet_name
}
