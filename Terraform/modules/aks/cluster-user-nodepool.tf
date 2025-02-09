resource "azurerm_kubernetes_cluster_node_pool" "linux" {
  zones   = var.zones
  auto_scaling_enabled   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.tf_cluster.id
  max_count             = var.user_nodepool_max_count
  min_count             = var.user_nodepool_min_count
  mode                  = "User"
  name                  = "linux"
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = var.user_os_disk_size_gb
  os_type               = "Linux"
  vm_size               = var.user_nodepool_vm_size
  priority              = "Regular" 
  node_labels = {
    "app"           = "apps"
  }
  vnet_subnet_id        = var.subnet_id
}