locals {
  tfstate_s3_name = "${var.app_id}-tfstate-s3-${var.environment_name}"
  tfstate_dyanmodb_name = "${var.app_id}-tfstate-dynamodb-${var.environment_name}"
}