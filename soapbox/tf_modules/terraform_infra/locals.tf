locals {
  tfstate_s3_name = "${var.environment_name}-${var.app_id}-tfstate-s3"
  tfstate_dyanmodb_name = "${var.environment_name}-${var.app_id}-tfstate-dynamodb"
}