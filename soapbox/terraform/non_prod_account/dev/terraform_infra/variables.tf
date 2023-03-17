variable "project_name" {
  type        = string
  description = "Name of project"
}

variable "app_id" {
  type        = string
  description = "Name of application"
}

variable "environment_name" {
  type        = string
  description = "Name of environment"
}


variable "aws_region" {
  type        = string
  description = "The AWS region the terraform infrastructure resides"
}
