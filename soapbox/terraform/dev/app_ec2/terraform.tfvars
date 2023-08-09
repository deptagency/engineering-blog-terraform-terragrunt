# These Terraform environment variables are duplicated each resource terraform.tfvars
# In Terragrunt, these variables are consolidated in one env.hcl
environment_name = "dev"
aws_region       = "us-east-1"

# Default AWS Tags
project_name = "engineering-blog-terraform-terragrunt"
app_id       = "soapbox-terraform"
owner        = "jirawat.uttayaya@deptagency.com"
cost_center  = "DEPT"

tags = {
  app-role = "compute"
}

# Note that terraform.tfvars are constants and cannot interpolate other variables
# So you have to hardcode and duplicate if you want to use the values of app_id and environment_name
ec2_prefix   = "soapbox-terraform-ec2-dev"
server_count = 1
server_type  = "t2.nano"
