# ----------------------------------------------------------------------------------------------------------------------
# General-use local variables
# Locals are useful for combining other variables and expressions to avoid repeating throughout.
# ----------------------------------------------------------------------------------------------------------------------

locals {
  vpc_name                    = var.vpc_name
  database_subnet_group_name  = "${local.vpc_name}-subnet-db-group"
  network_acl_name            = "${local.vpc_name}-default-network-acl"
  default_route_table_name    = "${local.vpc_name}-default-route-table"
  default_security_group_name = "${local.vpc_name}-default-sg"
  igw_name                    = "${local.vpc_name}-igw"

  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}