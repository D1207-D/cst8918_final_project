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

variable "kubernetes_version" {
  description = "Version of Kubernetes"
  type        = string
  default     = "1.26.0"
}

variable "node_count" {
  description = "Number of AKS worker nodes"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "Size of AKS worker nodes"
  type        = string
  default     = "Standard_D2s_v3"
}
