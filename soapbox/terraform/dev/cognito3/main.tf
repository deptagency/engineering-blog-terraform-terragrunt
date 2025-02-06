module "cognito" {
  # In Terraform, uncomment to use local module source
  # source = "../../../../modules/s3_secure"
  # In Terragrunt, no need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../..//modules/s3_secure
  #
  # For dev and local development, it is OK to use local directories for modules
  # For qa and prod env we will use git tags
  source = "../../../..//soapbox/tf_modules/cognito"

  # In Terraform, environment_name and app_id variable assignment are duplicated in multiple main.tf
  # In Terragrunt, these common modules variables are assigned once in the `inputs` section
  # of the root terragrunt/terragrunt.hcl
  user_pool_name = var.user_pool_name
  environment_name = var.environment_name
  app_id = var.app_id
  tags = var.tags
}
