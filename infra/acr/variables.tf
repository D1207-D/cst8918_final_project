variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "cst8918-final"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sku" {
  description = "The SKU name of the container registry"
  type        = string
  default     = "Standard"
}

variable "aks_principal_id" {
  description = "The principal ID of the AKS cluster's system assigned identity"
  type        = string
}
