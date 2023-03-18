# Configuration variables for the region
locals {
  # Primary App region
  aws_region = "us-east-2"

  bucket_region_dir      = replace(local.aws_region, "-", "_")
  bucket_terragrunt_path = "${get_original_terragrunt_dir()}/../../${local.bucket_region_dir}/s3"
}
