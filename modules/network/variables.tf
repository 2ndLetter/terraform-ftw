# Input variable definitions

variable "cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "project" {
  description = "Name tag"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "priv_sub" {
  description = "Private subnet address"
  type        = string
}

variable "pub_sub" {
  description = "Public subnet address"
  type        = string
}