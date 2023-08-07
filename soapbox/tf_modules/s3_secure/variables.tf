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