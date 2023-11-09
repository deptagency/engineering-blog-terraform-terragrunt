locals {
  name_prefix           = "${var.environment_name}-${var.app_id}"
  user_pool_fullname    = "${local.name_prefix}-${var.user_pool_name}"
}