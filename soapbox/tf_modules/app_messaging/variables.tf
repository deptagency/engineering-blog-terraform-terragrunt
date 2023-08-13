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

variable "sqs_name_01" {
  type        = string
  description = "Name of First SQS queue"
}

variable "sqs_name_02" {
  type        = string
  description = "Name of Second SQS queue"
}

variable "sns_name" {
  type        = string
  description = "Name of SNS topic"
}
