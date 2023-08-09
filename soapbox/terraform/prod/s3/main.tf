module "s3" {
  # In Terraform, uncomment to use local module source
  # source = "../../../../modules/s3_secure"
  # In Terragrunt, no need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../..//modules/s3_secure
  #
  # For dev and local development, it is OK to use local directories for modules
  # For qa and prod env we will use git tags
  source = "github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/tf_modules/s3_secure?ref=v1.0.0"

  # In Terraform, environment_name and app_id variable assignment are duplicated in multiple main.tf
  # In Terragrunt, these common modules variables are assigned once in the `inputs` section
  # of the root terragrunt/terragrunt.hcl
  environment_name = var.environment_name
  app_id           = var.app_id
  s3_bucket_name   = var.s3_bucket_name
  s3_random_suffix = var.s3_random_suffix
  s3_force_destroy = var.s3_force_destroy

  tags = var.tags
}
