resource "aws_security_group" "quicksight-rds-allow" {
  name        = "${var.app_id}-quicksight-rds-allow-sg"
  description = "Allow QuickSight access to RDS"
  vpc_id      = data.aws_vpc.env_vpc.id

  ingress = [
    {
      cidr_blocks = [
        "52.23.63.224/27",
      ]
      description      = "QuickSight us-east-1"
      from_port        = 5432
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 5432
    },
    {
      cidr_blocks      = []
      description      = "Airflow SG"
      from_port        = 5432
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        data.aws_security_group.airflow.id
      ]
      self    = false
      to_port = 5432
    },
  ]
}

resource "aws_security_group" "ec2-rds-1" {
  name        = "ec2-rds-1"
  description = "Security group attached to instances to securely connect to audi-vw-app-a-pg-dev. Modification could lead to connection loss."
  vpc_id      = data.aws_vpc.env_vpc.id
}

resource "aws_security_group" "rds-ec2-1" {
  name        = "rds-ec2-1"
  description = "Security group attached to audi-vw-app-a-pg-dev to allow EC2 instances with specific security groups attached to connect to the database. Modification could lead to connection loss."
  vpc_id      = data.aws_vpc.env_vpc.id

  ingress = [
    {
      cidr_blocks      = []
      description      = "Allow Quciksight to RDS"
      from_port        = 5432
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        data.aws_security_group.quicksight.id,
      ]
      self    = false
      to_port = 5432
    },
    {
      cidr_blocks      = []
      description      = "Rule to allow connections from EC2 instances with sg-0a486798e71f64c30 attached"
      from_port        = 5432
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        aws_security_group.ec2-rds-1.id,
      ]
      self    = false
      to_port = 5432
    },
  ]
}
