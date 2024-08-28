# Case-Study Infrastructure

This repository has Terraform code to deploy a case study infrastructure.

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
