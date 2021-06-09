provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = var.aks_config["resource_group_name"]
  location = var.aks_config["location"]
}


module "network" {
  version             = "3.3.0"
  source              = "Azure/network/azurerm"
  resource_group_name = var.aks_config["resource_group_name"]
  address_space       = var.aks_config["address_space"]
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
  depends_on          = [azurerm_resource_group.example]
}
data "azuread_group" "aks_cluster_admins" {
  display_name = var.aks_config["adgroup_name"]
}

module "aks" {
  version                          = "4.8.0"
  source                           = "Azure/aks/azurerm"
  resource_group_name              = var.aks_config["resource_group_name"]
  client_id                        = var.aks_config["client_id"]
  client_secret                    = var.aks_config["client_secret"]
  kubernetes_version               = var.aks_config["kubernetes_version"]
  orchestrator_version             = var.aks_config["orchestrator_version"]
  prefix                           = var.aks_config["cluster_name"]
  network_plugin                   = var.aks_config["network_plugin"]
  vnet_subnet_id                   = module.network.vnet_subnets[0]
  os_disk_size_gb                  = var.aks_config["os_disk_size_gb"]
  sku_tier                         = var.aks_config["sku_tier"]
  enable_role_based_access_control = var.aks_config["enable_role_based_access_control"]
  rbac_aad_admin_group_object_ids  = [data.azuread_group.aks_cluster_admins.id]
  rbac_aad_managed                 = var.aks_config["rbac_aad_managed"]
  private_cluster_enabled          = var.aks_config["private_cluster_enabled"] # default value
  enable_http_application_routing  = var.aks_config["enable_http_application_routing"]
  enable_azure_policy              = var.aks_config["enable_azure_policy"]
  enable_auto_scaling              = var.aks_config["enable_auto_scaling"]
  agents_min_count                 = var.aks_config["agents_min_count"]
  agents_max_count                 = var.aks_config["agents_max_count"]
  agents_count                     = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                  = var.aks_config["agents_max_pods"]
  agents_pool_name                 = var.aks_config["agents_pool_name"]
  agents_availability_zones        = var.agents_availability_zones
  agents_type                      = var.aks_config["agents_type"]
  agents_labels = {
    "nodepool" : "defaultnodepool"
  }
  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }
  network_policy                 = "azure"
  net_profile_dns_service_ip     = "10.0.0.10"
  net_profile_docker_bridge_cidr = "170.10.0.1/16"
  net_profile_service_cidr       = "10.0.0.0/16"
  depends_on                     = [module.network]
}
