locals {
  app_prefix                 = "${var.app_name}-${var.environment}"
  lambda_zip_dir             = "/tmp"
  lambda_name_hello_time_esm = "${local.app_prefix}-hello-time-esm"
}
