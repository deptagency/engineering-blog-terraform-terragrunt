# These Terraform environment variables are duplicated each resource terraform.tfvars
# In Terragrunt, these variables are consolidated in one env.hcl
environment_name = "dev"
aws_region       = "us-east-1"

# Default AWS Tags
project_name     = "engineering-blog-terraform-terragrunt"
## Change app_id to generate a unique S3 bucket backend
app_id           = "soapbox-terraform"
owner            = "jirawat.uttayaya@deptagency.com"
cost_center      = "DEPT"

tags = {
  app-role    = "terraform-infra"
}
