resource "aws_dynamodb_table" "tfstate_dynamodb" {
  name     = local.tfstate_dyanmodb_name
  hash_key = "LockID"
  # On-demand PAY_PER_REQUEST is cheaper for Terraform since there are infrequent requests
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 0
  write_capacity = 0

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge({ Name = local.tfstate_dyanmodb_name }, var.tags)
}