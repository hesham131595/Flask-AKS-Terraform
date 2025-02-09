output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.tf_cluster.name
}

output "aks_cluster_kubernetes_version" {
  value       = azurerm_kubernetes_cluster.tf_cluster.kubernetes_version
}



