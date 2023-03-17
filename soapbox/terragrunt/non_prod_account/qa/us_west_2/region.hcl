# Configuration variables for the region
locals {
  aws_region = "us-west-2"
  cidr       =  "172.16.0.0/16"

  # Note that terraform.tfvars cannot interpolate variables so the azs would have
  # hard-coded values, like us-east-1a and us-east-1b
  azs            = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  public_subnets = ["172.16.101.0/24", "172.16.102.0/24", "172.16.103.0/24"]
}
