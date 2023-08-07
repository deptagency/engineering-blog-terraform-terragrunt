# ----------------------------------------------------------------------------------------------------------------------
# General-use local variables
# Locals are useful for combining other variables and expressions to avoid repeating throughout.
# ----------------------------------------------------------------------------------------------------------------------
locals {
  full_s3_bucket_name = var.s3_random_suffix ? "${var.s3_bucket_name}-${random_integer.s3_suffix.result}" : var.s3_bucket_name
}