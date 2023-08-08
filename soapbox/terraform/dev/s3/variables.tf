# In Terraform, you have to declare duplicate environment_name and aws_region in all
# the resources variables.tf
# In Terragrunt, these environment common variables are defined in one env.hcl
# Terragrunt automatically uses the variables without having to explicitly declare them
variable "environment_name" {
  type        = string
  description = "Name of environment"
}

variable "aws_region" {
  type        = string
  description = "The AWS region of the deployment"
}

# For AWS Tags
variable "project_name" {
  type        = string
  description = "Name of project"
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

variable "owner" {
  type        = string
  description = "Owner of the infrastructure"
}

variable "cost_center" {
  type        = string
  description = "Cost center of the infrastructure"
}

# ----------------------------------------------------------------------------------------------------------------------
# Module variables
# ----------------------------------------------------------------------------------------------------------------------

variable "s3_bucket_name" {
  type        = string
  description = "Name of S3 bucket"
}

variable "s3_force_destroy" {
  type        = bool
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = false
}

variable "s3_random_suffix" {
  type        = bool
  description = "(Optional, Default:false ) A boolean that appends a random string suffix to S3 bucket name. Prevents bucket name clashes."
  default     = false
}
