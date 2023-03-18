# Access individual default_tags via the data source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags
data "aws_default_tags" "provider" {}

# Find app VPC and subnets
data "aws_vpc" "ec2_vpc" {
  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

data "aws_subnets" "ec2_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.ec2_vpc.id]
  }
}

# Find the latest Amazon Linux 2 AMI
data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${local.name_prefix}-ec2-instance-profile"
}

