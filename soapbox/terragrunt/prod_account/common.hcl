# Common configuration variables applicable to all environments (dev, qa)
# Replaces duplicate Terraform locals.tf in all Terraform infrastructure code
locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  project_name = "engineering-blog-terraform-terragrunt"
  app_id       = "soapbox-terragrunt"
  base_module_source_url = "github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/modules"
}