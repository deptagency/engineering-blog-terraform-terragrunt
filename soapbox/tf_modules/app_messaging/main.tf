# An Example of SNS-SQS fanout pattern
module "app_sqs_01" {
  source = "../../..//soapbox/tf_modules/sqs_secure"

  sqs_name         = var.sqs_name_01
  app_id           = var.app_id
  environment_name = var.environment_name

  tags = var.tags
}

module "app_sqs_02" {
  source = "../../..//soapbox/tf_modules/sqs_secure"

  sqs_name         = var.sqs_name_02
  app_id           = var.app_id
  environment_name = var.environment_name

  tags = var.tags
}

module "app_sns" {
  source = "../../..//soapbox/tf_modules/sns_secure"

  sns_name         = var.sns_name
  app_id           = var.app_id
  environment_name = var.environment_name

  tags = var.tags
}

resource "aws_sns_topic_subscription" "fanout_01" {
  topic_arn = module.app_sns.sqs_secure_arn
  protocol = "sqs"
  endpoint = module.app_sqs_01.sqs_secure_arn
}

resource "aws_sns_topic_subscription" "fanout_02" {
  topic_arn = module.app_sns.sqs_secure_arn
  protocol = "sqs"
  endpoint = module.app_sqs_02.sqs_secure_arn
}