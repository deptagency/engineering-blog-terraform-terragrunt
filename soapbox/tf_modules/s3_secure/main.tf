# ----------------------------------------------------------------------------------------------------------------------
# S3 Resources
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket" "s3_secure" {
  bucket = local.full_s3_bucket_name

  force_destroy = var.s3_force_destroy

  tags = merge({ Name = local.full_s3_bucket_name }, var.tags)
}

# Block all public access to S3 bucket
resource "aws_s3_bucket_public_access_block" "s3_secure" {
  bucket = aws_s3_bucket.s3_secure.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "s3_secure" {
  bucket = aws_s3_bucket.s3_secure.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
# Set Access Control List (ACL) for S3 bucket
# to List, Read, Write for Bucket owner only
resource "aws_s3_bucket_acl" "s3_secure" {
  depends_on = [
    aws_s3_bucket_public_access_block.s3_secure,
    aws_s3_bucket_ownership_controls.s3_secure,
  ]

  bucket = aws_s3_bucket.s3_secure.id
  acl    = "private"
}

## Only allow Transport Layer Security (TLS) access to the S3 bucket
resource "aws_s3_bucket_policy" "s3_secure" {
  bucket = aws_s3_bucket.s3_secure.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Sid       = "AllowTLSRequestsOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = ["s3:*"]
        Resource  = [aws_s3_bucket.s3_secure.arn, "${aws_s3_bucket.s3_secure.arn}/*"]
        Condition = {
          Bool = { "aws:SecureTransport" : false }
        }
      }
    ]
  })
}

# Enable versioning in case we need to recover previous versions
resource "aws_s3_bucket_versioning" "s3_secure" {
  bucket = aws_s3_bucket.s3_secure.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Encrypt using the default `aws/s3` AWS KMS master key
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_secure" {
  bucket = aws_s3_bucket.s3_secure.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}