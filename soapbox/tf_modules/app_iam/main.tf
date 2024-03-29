resource "aws_iam_role" "ec2_role" {
  name        = local.iam_ec2_role_name
  description = "Role for EC2 for app ${var.app_id} in ${var.environment_name}"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  # I prefer jsonencode over the Terraform data "aws_iam_policy_document"
  # because the jsonencode syntax is closer to what AWS UI uses
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge({ Name = local.iam_ec2_role_name }, var.tags)
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = aws_iam_role.ec2_role.name
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_policy" "app_s3_access" {
  name        = local.iam_s3_policy_name
  description = "Policy for S3 access for app ${var.app_id} in ${var.environment_name}"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = [data.aws_s3_bucket.app_s3_bucket.arn]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = ["${data.aws_s3_bucket.app_s3_bucket.arn}/*"]
      }
    ]
  })

  tags = merge({ Name = local.iam_s3_policy_name }, var.tags)
}

# aws_iam_policy_attachment has clunky production usage over detaching policies
# and exclusive attachments.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment
# Prefer the use of aws_iam_role_policy_attachment instead
resource "aws_iam_role_policy_attachment" "ec2_role_attach_ssm_access" {
  role       = aws_iam_role.ec2_role.id
  policy_arn = data.aws_iam_policy.ssm_access.arn
}


resource "aws_iam_role_policy_attachment" "ec2_role_attach_cloudwatch" {
  role       = aws_iam_role.ec2_role.id
  policy_arn = data.aws_iam_policy.cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "ec2_role_attach_s3_access" {
  role       = aws_iam_role.ec2_role.id
  policy_arn = aws_iam_policy.app_s3_access.arn
}