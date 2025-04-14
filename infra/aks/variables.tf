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

variable "subnet_id" {
  description = "ID of the subnet for AKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes"
  type        = string
  default     = "1.26.3"
}

variable "node_count" {
  description = "Number of AKS worker nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "Size of AKS worker nodes"
  type        = string
  default     = "Standard_D2s_v3"
}
