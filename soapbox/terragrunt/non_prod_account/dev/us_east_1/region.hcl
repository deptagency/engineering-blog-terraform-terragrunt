# Configuration variables for the region
locals {
  aws_region = "us-east-1"
  cidr       = "192.168.0.0/16"

  # Note that terraform.tfvars cannot interpolate variables so the azs would have
  # hard-coded values, like us-east-1a and us-east-1b
  azs            = ["${local.aws_region}a", "${local.aws_region}b"]
  public_subnets = ["192.168.100.0/22", "192.168.104.0/22"]
}
