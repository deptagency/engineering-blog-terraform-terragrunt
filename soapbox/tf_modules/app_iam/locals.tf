# ----------------------------------------------------------------------------------------------------------------------
# General-use local variables
# Locals are useful for combining other variables and expressions to avoid repeating throughout.
# ----------------------------------------------------------------------------------------------------------------------
locals {
  iam_ec2_role_name = "${var.iam_prefix}-ec2-role"
  iam_s3_policy_name = "${var.iam_prefix}-app-s3-policy"
}