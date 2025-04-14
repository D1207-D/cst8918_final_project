variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
