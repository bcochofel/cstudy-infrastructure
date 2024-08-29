# Case-Study Infrastructure

This repository has Terraform code to deploy a case study infrastructure.
It uses semantic versioning, conventional commits, and Azure naming convention for resources.

## [Hashicorp Cloud Platform Integration](sec-hcp-integration)

The GitHub Workflows are integrated with HCP Terraform API.
More information can be found [here](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#set-up-hcp-terraform)

## [Terraform Modules](sec-terraform-modules)

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

## [How-to](sec-how-to)

After cloning this repository, if you want to take advantage of `pre-commit` execute the following commands:

```bash
# install pre-commit using pip
pip install pre-commit
# install pre-commit hooks (move to the repository directory)
pre-commit install
pre-commit install --install-hooks -t commit-msg
# run all checks manually
# be sure to install all the dependencies:
# terraform
# TFlint
# TFlint azureRM plugin
# TFsec
# checkov
# terraform-docs
pre-commit run --all-files
```

Running `pre-commit` will give you feedback in a "shift-left" approach, so you can find typos/errors, and check compliance, before applying your code or running any pipeline.

You can also run semantic-release locally, to check if the workflow is running as expected.
Execute the following command after installing semantic-release:

```bash
# you need GITHUB_TOKEN environment variable set
# more info here: https://github.com/semantic-release/github
npx semantic-release --dry-run --ci
```

The code assumes you have Terraform environment variables for the AzureRM provider. You will need to set the following variables:

```bash
export ARM_CLIENT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
export ARM_CLIENT_SECRET="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
export ARM_TENANT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
export ARM_SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```

Since everything else uses the HCP Terraform API integration, you just need to edit the code, create a pull request, and a plan will be uploaded to HCP.
Be sure to check [HCP integration](sec-hcp-integration) section and follow the procedure for your own environment.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.106.1, < 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | Azure/aks/azurerm | 9.1.0 |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.4.1 |
| <a name="module_rg"></a> [rg](#module\_rg) | bcochofel/resource-group/azurerm | 1.6.0 |
| <a name="module_snet"></a> [snet](#module\_snet) | bcochofel/subnet/azurerm | 1.4.0 |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | bcochofel/virtual-network/azurerm | 1.3.0 |

## Resources

| Name | Type |
|------|------|
| [random_id.name](https://registry.terraform.io/providers/hashicorp/random/3.3.2/docs/resources/id) | resource |

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

## [References](sec-references)

- [semantic versioning](https://semver.org/)
- [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [keep a changelog](https://keepachangelog.com/en/1.1.0/)
- [pre-commit](https://pre-commit.com/)
- [semantic-release](https://semantic-release.gitbook.io/semantic-release)
