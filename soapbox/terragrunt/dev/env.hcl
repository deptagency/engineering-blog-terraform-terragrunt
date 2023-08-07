# Configuration variables for the dev environment
# Replaces duplicate Terraform environment terraform.tfvars in all Terraform infrastructure code
# Seeing all the dev environment variables in one place make it easier to
# understand and configure the whole environment
locals {
  project_name     = "engineering-blog-terraform-terragrunt"
  app_id           = "soapbox-terragrunt"
  environment_name = "dev"
  aws_region       = "us-east-1"
  owner            = "jirawat.uttayaya@deptagency.com"
  cost_center      = "DEPT"

  # VPC variables
  vpc_name      = "${local.app_id}-vpc-${local.environment_name}"
  vpc_cidr      = "10.10.0.0/16"
  number_of_azs = 3
  vpc_tags = {
    app-role    = "networking"
    app-purpose = "blog demo"
  }
  #  server_count = 1
  #  server_type  = "t2.nano"
}