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

variable "user_pool_name" {
  type        = string
  description = "Name of User Pool"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of AWS tags"
  default     = {}
}
