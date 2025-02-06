locals {
  vpc_name                    = var.vpc_name
  default_network_acl_name    = "${local.vpc_name}-network-acl"
  default_route_table_name    = "${local.vpc_name}-route-table"
  default_security_group_name = "${local.vpc_name}-sg"
  igw_name                    = "${local.vpc_name}-igw"

  azs = slice(data.aws_availability_zones.available.names, 0, var.number_of_azs)
}