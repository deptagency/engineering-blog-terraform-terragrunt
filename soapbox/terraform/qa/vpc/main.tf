# This example VPC mimics the default AWS VPC setup
module "vpc" {
  # In Terraform, uncomment to use local module source
  # source = "../../../../modules/vpc_simple"
  # In Terragrunt, no need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../..//modules/vpc_simple
  #
  # For dev and local development, it is OK to use local directories for modules
  # For qa and prod env we will use git tags
  source = "github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/tf_modules/vpc_simple?ref=v1.6.0"

  # In Terraform, environment_name and app_id variable assignment are duplicated in multiple main.tf
  # In Terragrunt, these common modules variables are assigned once in the `inputs` section
  # of the root terragrunt/terragrunt.hcl
  environment_name = var.environment_name
  app_id           = var.app_id
  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  number_of_azs    = var.number_of_azs

  tags = var.tags
}
