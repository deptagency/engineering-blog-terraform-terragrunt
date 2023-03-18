# Configuration variables for the dev environment
# Replaces duplicate Terraform environment terraform.tfvars in all Terraform infrastructure code
# Seeing all the dev environment variables in one place make it easier to
# understand and configure the whole environment
locals {
  environment_name       = "qa"
  terraform_infra_region = "us-west-1"

  iam_terragrunt_path = "${get_original_terragrunt_dir()}/../../global/iam"

  server_count = 2
  server_type  = "t2.micro"
}