# ----------------------------------------------------------------------------------------------------------------------
# VPC Module
# ----------------------------------------------------------------------------------------------------------------------

module "standard_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = local.vpc_name
  cidr = var.vpc_cidr

  azs              = local.azs
  public_subnets   = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  private_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 3)]
  database_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 6)]

  public_subnet_suffix   = "subnet-public"
  private_subnet_suffix  = "subnet-private"
  database_subnet_suffix = "subnet-database"

  create_database_subnet_group = true
  database_subnet_group_name   = local.database_subnet_group_name

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  default_network_acl_name    = local.network_acl_name
  default_route_table_name    = local.default_route_table_name
  default_security_group_name = local.default_security_group_name
  igw_tags = {
    Name = local.igw_name
  }

  tags = var.tags
}
