resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "cluster"
}

resource "azurerm_kubernetes_cluster" "tf_cluster" {
  name                  = var.aks_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  dns_prefix            = random_pet.azurerm_kubernetes_cluster_dns_prefix.id
  kubernetes_version    = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group   = "${var.resource_group_name}-nodes"
  private_cluster_enabled = true
  default_node_pool {
    name                 = var.system_nodepool_name
    zones                = var.zones
    auto_scaling_enabled = true
    min_count            = var.system_nodepool_min_count
    max_count            = var.system_nodepool_max_count
    os_disk_size_gb      = var.system_os_disk_size_gb
    vm_size              = var.system_nodepool_vm_size
    vnet_subnet_id       = var.subnet_id
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
        key_data = file("${var.public_key_path}")
  }
  }
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

