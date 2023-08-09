module "app_ec2" {
  # In Terraform, uncomment to use local module source
  # source = "../../../../modules/app_ec2"
  # In Terragrunt, no need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../..//modules/app_ec2
  #
  # For dev and local development, it is OK to use local directories for modules
  # For qa and prod env we will use git tags
  source = "github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/tf_modules/app_ec2?ref=v1.0.0"

  # In Terraform, environment_name and app_id variable assignment are duplicated in multiple main.tf
  # In Terragrunt, these common modules variables are assigned once in the `inputs` section
  # of the root terragrunt/terragrunt.hcl
  environment_name = var.environment_name
  app_id           = var.app_id
  ec2_prefix       = var.ec2_prefix
  server_count     = var.server_count
  server_type      = var.server_type

  vpc_name                  = local.vpc_name
  ec2_instance_profile_name = data.terraform_remote_state.lookup_iam_module.outputs.iam.ec2_instance_profile_name

  tags = var.tags
}
