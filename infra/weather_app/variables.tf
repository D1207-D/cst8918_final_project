variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "redis_host" {
  description = "Redis server hostname"
  type        = string
  sensitive   = true
}

variable "redis_port" {
  description = "Redis server port"
  type        = string
  sensitive   = true
}

variable "redis_primary_key" {
  description = "Redis server primary access key"
  type        = string
  sensitive   = true
}

variable "acr_login_server" {
  description = "Azure Container Registry login server"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

variable "replicas" {
  description = "Number of replicas for the deployment"
  type        = number
  default     = 2
}
