# Configuration variables for the qa environment
# Replaces duplicate Terraform environment terraform.tfvars in all Terraform infrastructure code
# Seeing all the environment variables in one place make it easier to
# understand and configure the whole environment
locals {
  environment_name = "prod2"
  aws_region       = "us-west-2"

  # Default AWS Tags
  project_name     = "engineering-blog-terraform-terragrunt"
  ## Change app_id to generate a unique S3 bucket backend
  app_id           = "soapbox-terragrunt"
  owner            = "jirawat.uttayaya@deptagency.com"
  cost_center      = "DEPT"

  aws_resource_prefix = "${local.environment_name}-${local.app_id}"

  # VPC variables
  vpc_name      = "${local.aws_resource_prefix}-vpc"
  vpc_cidr      = "10.100.0.0/16"
  number_of_azs = 3
  vpc_tags = {
    app-role    = "networking"
  }
}