resource "aws_security_group" "app_ec2" {
  name        = "${var.ec2_prefix}-sg"
  description = "Security group attached to ${var.app_id} EC2 instances in the ${var.environment_name} env."
  vpc_id      = data.aws_vpc.ec2_vpc.id

  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow all egress to HTTPS"
      from_port        = 443
      to_port          = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      self    = false
      security_groups  = []
    }
  ]
}
