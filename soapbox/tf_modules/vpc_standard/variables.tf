# ----------------------------------------------------------------------------------------------------------------------
# General-use variables
# ----------------------------------------------------------------------------------------------------------------------

variable "environment_name" {
  type        = string
  description = "Name of environment"
}

variable "app_id" {
  type        = string
  description = "Name of application"
}

# ----------------------------------------------------------------------------------------------------------------------
# Module variables
# ----------------------------------------------------------------------------------------------------------------------

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR of the VPC"
}

variable "tags" {
  type    = map(string)
  default = {}
}
