variable "aws_region" {
  type        = string
  description = "The AWS region that the app will be deployed in"
}

variable "project_name" {
  type        = string
  description = "The name of the project or git-repo"
}

variable "app_name" {
  type        = string
  description = "The application name"
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}
