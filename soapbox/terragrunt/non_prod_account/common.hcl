# Common configuration variables applicable to all environments (dev, qa)
# Replaces duplicate Terraform locals.tf in all Terraform infrastructure code
locals {
  project_name           = "engineering-blog-terraform-terragrunt"
  app_id                 = "soapbox-terragrunt"
}