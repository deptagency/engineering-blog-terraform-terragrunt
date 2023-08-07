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

variable "tags" {
  type        = map(string)
  description = "AWS tags to apply to resources"
  default     = {}
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

variable "number_of_azs" {
  type        = number
  description = "The number of Availability Zones of the VPC"
  default     = 3
}
