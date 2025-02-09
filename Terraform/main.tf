module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  address_prefixes    = var.address_prefixes
}

module "aks" {
  source                = "./modules/aks"
  aks_name              = var.aks_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  zones                 = var.zones
  system_nodepool_name  = var.system_nodepool_name
  system_nodepool_min_count = var.system_nodepool_min_count
  system_nodepool_max_count = var.system_nodepool_max_count
  system_nodepool_vm_size   = var.system_nodepool_vm_size
  system_os_disk_size_gb    = var.system_os_disk_size_gb
  subnet_id                 = module.network.subnet_id
  admin_username            = var.admin_username
  public_key_path           = var.public_key_path
  user_nodepool_vm_size     = var.user_nodepool_vm_size
  user_os_disk_size_gb      = var.user_os_disk_size_gb
  user_nodepool_min_count   = var.user_nodepool_min_count
  user_nodepool_max_count   = var.user_nodepool_max_count
  
}
