## Resource Group values
location = "EAST US"  
resource_group_name = "aks-rg"

## Netowrk values
vnet_name = "tf-cluster-network"
address_space = ["10.0.0.0/8"]
subnet_name = "tf-cluster-subnet"
address_prefixes = ["10.1.0.0/16"]

## AKS values
zones = [1, 2]
aks_name = "tf-cluster"
system_nodepool_name = "akspool"
system_nodepool_min_count = 1
system_nodepool_max_count = 3
system_nodepool_vm_size = "Standard_D2alds_v6"
system_os_disk_size_gb = 30
admin_username = "adminuser"
public_key_path = "~/.ssh/aks-keys/cluster-key.pub"
user_nodepool_vm_size = "Standard_D2alds_v6"
user_os_disk_size_gb = 30
user_nodepool_min_count = 1
user_nodepool_max_count = 3



