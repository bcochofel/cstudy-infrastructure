module "naming" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "Azure/naming/azurerm"
  version = "0.4.1"

  suffix = [
    var.workload,
    var.environment,
    var.location
  ]
}

module "rg" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "bcochofel/resource-group/azurerm"
  version = "1.6.0"

  name     = module.naming.resource_group.name_unique
  location = var.location

  tags = var.tags
}

module "vnet" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "bcochofel/virtual-network/azurerm"
  version = "1.3.0"

  resource_group_name = module.rg.name
  name                = module.naming.virtual_network.name_unique
  address_space       = ["10.0.0.0/16"]

  tags = var.tags
}

module "snet" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "bcochofel/subnet/azurerm"
  version = "1.4.0"

  name                    = module.naming.subnet.name_unique
  resource_group_name     = module.rg.name
  resource_group_location = module.rg.location
  nsg_name                = module.naming.network_security_group.name_unique
  virtual_network_name    = module.vnet.name
  address_prefixes        = ["10.0.0.0/24"]

  tags = var.tags
}

module "aks" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "Azure/aks/azurerm"
  version = "9.1.0"

  cluster_name              = module.naming.kubernetes_cluster.name_unique
  resource_group_name       = module.rg.name
  kubernetes_version        = "1.29" # don't specify the patch version!
  automatic_channel_upgrade = "patch"
  agents_availability_zones = ["1", "2", "3"]
  agents_count              = null
  agents_max_count          = 2
  agents_max_pods           = 100
  agents_min_count          = 1
  agents_pool_name          = "testnodepool"
  agents_type               = "VirtualMachineScaleSets"
  azure_policy_enabled      = true
  enable_auto_scaling       = true

  log_analytics_workspace_enabled      = true
  cluster_log_analytics_workspace_name = module.naming.log_analytics_workspace.name_unique

  private_cluster_enabled           = true
  rbac_aad                          = true
  rbac_aad_managed                  = true
  role_based_access_control_enabled = true

  sku_tier       = "Standard"
  vnet_subnet_id = module.snet.id

  depends_on = [
    module.snet,
  ]
}
