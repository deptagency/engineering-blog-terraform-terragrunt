# Configuration variables for the dev environment
# Replaces duplicate Terraform environment terraform.tfvars in all Terraform infrastructure code
# Seeing all the environment variables in one place make it easier to
# understand and configure the whole environment
locals {
  environment_name = "dev"
  aws_region       = "us-east-1"

  # Default AWS Tags
  project_name     = "engineering-blog-terraform-terragrunt"
  ## Change app_id to generate a unique S3 bucket backend
  app_id           = "soapbox-terragrunt"
  owner            = "jirawat.uttayaya@deptagency.com"
  cost_center      = "DEPT"

  aws_resource_prefix = "${local.environment_name}-${local.app_id}"

  # VPC variables
  vpc_name      = "${local.aws_resource_prefix}-vpc"
  vpc_cidr      = "10.10.0.0/16"
  number_of_azs = 3
  vpc_tags = {
    app-role    = "networking"
  }

  # S3 variables
  s3_bucket_name = "${local.aws_resource_prefix}-s3"
  s3_random_suffix = true
  s3_force_destroy = true
  s3_tags = {
    app-role    = "datastore"
  }

  # Messaging variables
  sns_name = "${local.aws_resource_prefix}-sns"
  sqs_name_01 = "${local.aws_resource_prefix}-sqs-alpha"
  sqs_name_02 = "${local.aws_resource_prefix}-sqs-beta"
  messaging_tags = {
    app-role    = "messaging"
  }

  # IAM variables
  iam_prefix = "${local.aws_resource_prefix}-iam"
  iam_tags = {
    app-role    = "security"
  }

  # EC2 variables
  ec2_prefix = "${local.aws_resource_prefix}-ec2"
  server_count = 1
  server_type  = "t2.nano"
  ec2_tags = {
    app-role    = "compute"
  }
}