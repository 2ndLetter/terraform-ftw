# Input variable definitions

variable "cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "tag_name" {
  description = "Name tag"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

