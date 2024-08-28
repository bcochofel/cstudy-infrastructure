provider "azurerm" {
  features {}
}

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

  tags = {
    ManagedBy   = "Terraform"
    Environment = var.environment
  }
}
