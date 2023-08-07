resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # In production, force_destroy is false and prevent_destroy is true to prevent accidental destruction of S3 bucket
  # For the demo, we set it the opposite so we can easily destroy the bucket when done
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = var.bucket_name
  }
}

# Set Access Control List (ACL) for Terraform State S3 bucket
# to List, Read, Write for Bucket owner only
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

# Enable versioning in case we need to recover previous versions of the Terraform state
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    mfa_delete = "Disabled"
    status     = "Enabled"
  }
}

# Encrypt the Terraform state using the default `aws/s3` AWS KMS master key
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

# Block all public access to Terraform state S3 bucket
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

## Only allow Transport Layer Security (TLS) access to the Terraform state S3 bucket
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Sid       = "AllowTLSRequestsOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = ["s3:*"]
        Resource  = [aws_s3_bucket.this.arn, "${aws_s3_bucket.this.arn}/*"]
        Condition = {
          Bool = { "aws:SecureTransport" : false }
        }
      }
    ]
  })
}