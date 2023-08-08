resource "aws_s3_bucket" "tfstate_s3" {
  bucket = local.tfstate_s3_name

  # By default, allow_destroy is false to prevent accidental destruction of S3 bucket
  force_destroy = false
  lifecycle {
    prevent_destroy = true
  }

  tags = merge({ Name = local.tfstate_s3_name }, var.tags)
}

# Block all public access to Terraform state S3 bucket
resource "aws_s3_bucket_public_access_block" "tfstate_s3" {
  bucket = aws_s3_bucket.tfstate_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "tfstate_s3" {
  bucket = aws_s3_bucket.tfstate_s3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Set Access Control List (ACL) for Terraform State S3 bucket
# to List, Read, Write for Bucket owner only
resource "aws_s3_bucket_acl" "tfstate_s3" {
  depends_on = [
    aws_s3_bucket_public_access_block.tfstate_s3,
    aws_s3_bucket_ownership_controls.tfstate_s3,
  ]

  bucket = aws_s3_bucket.tfstate_s3.id
  acl    = "private"
}

# Enable versioning in case we need to recover previous versions of the Terraform state
resource "aws_s3_bucket_versioning" "tfstate_s3" {
  bucket = aws_s3_bucket.tfstate_s3.id
  versioning_configuration {
    mfa_delete = "Disabled"
    status     = "Enabled"
  }
}

# Encrypt the Terraform state using the default `aws/s3` AWS KMS master key
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_s3" {
  bucket = aws_s3_bucket.tfstate_s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}


## Only allow Transport Layer Security (TLS) access to the Terraform state S3 bucket
resource "aws_s3_bucket_policy" "tfstate_s3" {
  bucket = aws_s3_bucket.tfstate_s3.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Sid       = "AllowTLSRequestsOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = ["s3:*"]
        Resource  = [aws_s3_bucket.tfstate_s3.arn, "${aws_s3_bucket.tfstate_s3.arn}/*"]
        Condition = {
          Bool = { "aws:SecureTransport" : false }
        }
      }
    ]
  })
}