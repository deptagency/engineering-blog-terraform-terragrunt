output "ec2_role_id" {
  value = aws_iam_role.ec2_role.id
}

output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "ec2_instance_profile_arn" {
  value = aws_iam_instance_profile.ec2_instance_profile.arn
}

output "ec2_role" {
  value = aws_iam_role.ec2_role
}