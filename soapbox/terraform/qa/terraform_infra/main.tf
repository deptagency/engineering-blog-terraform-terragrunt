module "terraform_infra" {
  # In Terraform, uncomment to use local module source
  # source = "../../../..//soapbox/tf_modules/terraform_infra"
  # In Terragrunt, no need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../..//soapbox/tf_modules/terraform_infra
  #
  # Note that in Terragrunt the module git URL is centralized in the terragrunt/_envcommon/common.hcl
  # instead of copy and pasted in multiple main.tf
  # For dev and local development, it is OK to use local directories for modules
  # For qa and prod env we will use git tags
  source = "github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/tf_modules/terraform_infra?ref=v1.6.0"

  # In Terraform, environment_name and app_id variable assignment are duplicated in multiple main.tf
  # In Terragrunt, these common modules variables are assigned once in the `inputs` section
  # of the root terragrunt/terragrunt.hcl
  environment_name = var.environment_name
  app_id           = var.app_id

  tags = var.tags
}
