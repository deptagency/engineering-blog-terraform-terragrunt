# ----------------------------------------------------------------------------------------------------------------------
# Module outputs
# ----------------------------------------------------------------------------------------------------------------------

output "id" {
  value = aws_s3_bucket.s3_secure.id
}

output "arn" {
  value = aws_s3_bucket.s3_secure.arn
}

output "region" {
  value = aws_s3_bucket.s3_secure.region
}

output "s3_secure" {
  value = aws_s3_bucket.s3_secure
}