variable "workload" {
  description = "Workload for Azure naming convention."
  type        = string
  default     = "demo"
}

variable "location" {
  description = "Azure Region to create resource."
  type        = string
  default     = "northeurope"
}

variable "environment" {
  description = "Environment for Azure naming convention."
  type        = string
  default     = "sandbox"
}

variable "tags" {
  description = "A mapping of tags which should be assigned to Resources."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}
