resource "aws_instance" "app_main_ec2" {
  count                = var.server_count
  instance_type        = var.server_type
  ami                  = data.aws_ami.ec2_ami.id
  iam_instance_profile = data.aws_iam_instance_profile.ec2_instance_profile.name

  # Ensures equal distribution of EC2 in the subnets.
  # element automatically does a modulo if count.index is greater than length of subnet IDs
  subnet_id = element(tolist(data.aws_subnets.ec2_subnets.ids), count.index)

  tags = {
    Name = "${local.name_prefix}-ec2-${count.index}"
  }

  # Assigns the default tags to volumes attached to this EC2 instance
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#volume_tags
  volume_tags = merge(
    data.aws_default_tags.provider.tags,
    { Name = "${local.name_prefix}-ebs-${count.index}" }
  )

}