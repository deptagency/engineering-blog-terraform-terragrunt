# Configuration variables for the qa environment
# Replaces duplicate Terraform environment terraform.tfvars in all Terraform infrastructure code
# Seeing all the environment variables in one place make it easier to
# understand and configure the whole environment
locals {
  environment_name = "prod"
  aws_region       = "us-west-2"

  # Default AWS Tags
  project_name     = "engineering-blog-terraform-terragrunt"
  ## Change app_id to generate a unique S3 bucket backend
  app_id           = "soapbox-terragrunt"
  owner            = "jirawat.uttayaya@deptagency.com"
  cost_center      = "DEPT"
  app-purpose      = "blog demo"

  # VPC variables
  vpc_name      = "${local.app_id}-vpc-${local.environment_name}"
  vpc_cidr      = "10.100.0.0/16"
  number_of_azs = 3
  vpc_tags = {
    app-role    = "networking"
  }

  # S3 variables
  s3_bucket_name = "${local.app_id}-s3-${local.environment_name}"
  s3_random_suffix = true
  s3_force_destroy = true
  s3_tags = {
    app-role    = "datastore"
  }

  # IAM variables
  iam_prefix = "${local.app_id}-iam-${local.environment_name}"
  iam_tags = {
    app-role    = "security"
  }

  #  server_count = 1
  #  server_type  = "t2.nano"
}