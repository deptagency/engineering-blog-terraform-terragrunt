# ----------------------------------------------------------------------------------------------------------------------
# General-use local variables
# Locals are useful for combining other variables and expressions to avoid repeating throughout.
# ----------------------------------------------------------------------------------------------------------------------

locals {
  aurora_name                = "${var.app_id}-a-pg-${var.environment_name}"
  database_subnet_group_name = "${var.vpc_name}-subnet-database-group"
  autoscaling_policy_name    = "${local.aurora_name}-autoscale-policy"
}