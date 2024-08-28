# Case-Study Infrastructure

This repository has Terraform code to deploy a case study infrastructure.
It uses semantic versioning, conventional commits, and Azure naming convention for resources.

## Terraform Modules

The code from this repository uses some modules from both Azure and my own GitHub.

Modules from my own repos have some static code analysis tools, used with pre-commit, and also use semantic versioning and conventional commits.
Here's the list of modules:

- [terraform-azurerm-resource-group](https://github.com/bcochofel/terraform-azurerm-resource-group)
- [terraform-azurerm-virtual-network](https://github.com/bcochofel/terraform-azurerm-virtual-network)
- [terraform-azurerm-subnet](https://github.com/bcochofel/terraform-azurerm-subnet)

All the modules have the same GitHub Workflows, and use the following tools:

- [pre-commit](https://pre-commit.com/)
- [semantic-release](https://semantic-release.gitbook.io/semantic-release)
- [terratest](https://terratest.gruntwork.io/)

They are available in Terraform Registry, and use Terraform naming convention for modules, alongside examples and automatically generated documentation.

List of static code analysis tools:

- [TFlint w/ AzureRM plugin](https://github.com/terraform-linters/tflint)
- [TFsec](https://github.com/aquasecurity/tfsec)
- [checkov](https://www.checkov.io/)
- [terraform-docs](https://terraform-docs.io/)

The semantic-release ensures that a new release is created every time a merge to the default branch is triggered, and also generates a CHANGELOG.md file from the conventional commit messages.

Additional modules come from Azure, like the `naming` and `aks`.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.106.1, < 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | Azure/aks/azurerm | 9.1.0 |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.4.1 |
| <a name="module_rg"></a> [rg](#module\_rg) | bcochofel/resource-group/azurerm | 1.6.0 |
| <a name="module_snet"></a> [snet](#module\_snet) | bcochofel/subnet/azurerm | 1.4.0 |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | bcochofel/virtual-network/azurerm | 1.3.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for Azure naming convention. | `string` | `"sandbox"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region to create resource. | `string` | `"northeurope"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to Resources. | `map(string)` | <pre>{<br>  "ManagedBy": "Terraform"<br>}</pre> | no |
| <a name="input_workload"></a> [workload](#input\_workload) | Workload for Azure naming convention. | `string` | `"demo"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
