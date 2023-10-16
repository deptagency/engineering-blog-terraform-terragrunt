# ----------------------------------------------------------------------------------------------------------------------
# General-purpose data lookups for existing core infrastructure utlized throughout the module
# ----------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "env_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "private_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.env_vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "*subnet-private*"
    ]
  }
}

data "aws_subnet" "private_vpc_subnet" {
  for_each = toset(data.aws_subnets.private_vpc_subnets.ids)
  id       = each.value
}

data "aws_security_group" "airflow" {
  name = "airflow-security-group-audi-vw-app-airflow-dev-5Bf7Bu"
}

data "aws_security_group" "quicksight" {
  name = "audi-vw-app-quicksight-service-role-sg"
}