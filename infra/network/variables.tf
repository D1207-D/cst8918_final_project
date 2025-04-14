variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "group_number" {
  description = "Your group number from Brightspace"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}
