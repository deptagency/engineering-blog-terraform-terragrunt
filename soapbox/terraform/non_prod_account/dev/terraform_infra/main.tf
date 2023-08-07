module "terraform_infra" {
  # In Terraform, uncomment line below to use local module source
  source = "../../../../tf_modules/terraform_infra"
  # source = "https://github.com/deptagency/engineering-blog-terraform-terragrunt//soapbox/modules?ref=main"

  app_id           = var.app_id
  environment_name = var.environment_name
}
