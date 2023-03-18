# Configuration variables for the region
locals {
  # Overriding the environment_name and terraform_infra_region from env.hcl
  environment_name       = "failover"
  aws_region             = "us-west-2"
  terraform_infra_region = local.aws_region
  cidr                   = "10.50.0.0/16"

  # Note that terraform.tfvars cannot interpolate variables so the azs would have
  # hard-coded values, like us-east-1a and us-east-1b
  azs            = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  public_subnets = ["10.50.101.0/24", "10.50.102.0/24", "10.50.103.0/24"]
}
