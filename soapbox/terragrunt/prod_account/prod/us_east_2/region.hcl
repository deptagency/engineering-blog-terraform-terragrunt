# Configuration variables for the region
locals {
  aws_region = "us-east-2"
  cidr       =  "10.10.0.0/16"

  # Note that terraform.tfvars cannot interpolate variables so the azs would have
  # hard-coded values, like us-east-1a and us-east-1b
  azs            = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  public_subnets = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
}
