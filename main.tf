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

#module "vnet" {
#  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
#  source  = "bcochofel/virtual-network/azurerm"
#  version = "1.3.0"
#
#  resource_group_name = module.rg.name
#  name                = module.naming.virtual_network.name_unique
#  address_space       = ["10.0.0.0/16"]
#
#  tags = var.tags
#}
#
#module "snet" {
#  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
#  source  = "bcochofel/subnet/azurerm"
#  version = "1.4.0"
#
#  name                    = module.naming.subnet.name_unique
#  resource_group_name     = module.rg.name
#  resource_group_location = module.rg.location
#  nsg_name                = module.naming.network_security_group.name_unique
#  virtual_network_name    = module.vnet.name
#  address_prefixes        = ["10.0.0.0/24"]
#
#  tags = var.tags
#}
#
