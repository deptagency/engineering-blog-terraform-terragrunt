# Configuration variables for the dev environment
# Replaces duplicate Terraform environment terraform.tfvars in all Terraform infrastructure code
# Seeing all the dev environment variables in one place make it easier to
# understand and configure the whole environment
locals {
  environment_name       = "prod"
  terraform_infra_region = "us-east-2"

  iam_terragrunt_path = "${get_original_terragrunt_dir()}/../../global/iam"

  server_count = 3
  server_type  = "t3.micro"
}