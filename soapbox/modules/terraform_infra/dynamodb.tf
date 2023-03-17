resource "aws_dynamodb_table" "tfstate_dynamodb" {
  name     = "${local.name_prefix}-tfstate-dynamodb"
  hash_key = "LockID"
  # On-demand PAY_PER_REQUEST is cheaper for Terraform since there are infrequent requests
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 0
  write_capacity = 0

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${local.name_prefix} Terraform tfstate dynamodb"
  }
}