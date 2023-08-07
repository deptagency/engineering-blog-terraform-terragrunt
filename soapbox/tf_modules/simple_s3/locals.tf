locals {
  name_prefix = "${var.environment_name}-${var.app_id}"
  bucket_name = "${local.name_prefix}-${var.bucket_name_suffix}"
}