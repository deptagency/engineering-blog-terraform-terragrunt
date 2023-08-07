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
  description = "(Optional) A mapping of AWS tags"
  default     = {}
}

# ----------------------------------------------------------------------------------------------------------------------
# Module variables
# ----------------------------------------------------------------------------------------------------------------------
variable "ec2_prefix" {
  type        = string
  description = "Prefix for EC2 instance names"
}

variable "server_count" {
  type        = number
  description = "Number of EC2 instances for this application"
}

variable "server_type" {
  type        = string
  description = "AWS EC2 instance type for this application"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}

variable "ec2_instance_profile_name" {
  type        = string
  description = "Name of EC2 instance profile"
}