module "iam" {
  # In Terraform, uncomment to use local module source
  # source = "../../../../modules/app_iam"
  # In Terragrunt, no need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../..//modules/app_iam
  #
  # For dev and local development, it is OK to use local directories for modules
  # For qa and prod env we will use git tags
  source = "github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/tf_modules/app_iam?ref=v1.6.0"

  # In Terraform, environment_name and app_id variable assignment are duplicated in multiple main.tf
  # In Terragrunt, these common modules variables are assigned once in the `inputs` section
  # of the root terragrunt/terragrunt.hcl
  environment_name = var.environment_name
  app_id           = var.app_id
  bucket_name      = data.terraform_remote_state.lookup_s3_module.outputs.s3.id
  iam_prefix       = var.iam_prefix

  tags = var.tags
}
