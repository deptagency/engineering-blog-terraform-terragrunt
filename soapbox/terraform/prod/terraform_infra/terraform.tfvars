# These Terraform environment variables are duplicated each resource terraform.tfvars
# In Terragrunt, these variables are consolidated in one env.hcl
environment_name = "prod"
aws_region       = "us-west-2"

# Default AWS Tags
project_name = "engineering-blog-terraform-terragrunt"
app_id       = "soapbox-terraform"
owner        = "jirawat.uttayaya@deptagency.com"
cost_center  = "DEPT"

tags = {
  app-role = "terraform-infra"
}
