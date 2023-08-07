################################################################################
# VPC Module
################################################################################
module "vpc_simple" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = local.vpc_name
  cidr = var.vpc_cidr

  azs                  = local.azs
  public_subnets       = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  public_subnet_suffix = "subnet-public"

  enable_ipv6             = false
  map_public_ip_on_launch = true
  enable_dns_hostnames    = true

  create_igw             = true
  create_egress_only_igw = false
  enable_nat_gateway     = false

  default_network_acl_name    = local.default_network_acl_name
  default_route_table_name    = local.default_route_table_name
  default_security_group_name = local.default_security_group_name
  igw_tags = {
    Name = local.igw_name
  }

  tags = var.tags
}
