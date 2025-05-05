terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }

  backend "s3" {
    bucket         = "soapbox-terraform-tfstate-s3-dev"
    region         = "us-east-1"
    key            = "apigw/terraform.tfstate"
    dynamodb_table = "soapbox-terraform-tfstate-dynamodb-dev"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region

  # See info about default_tags at
  # https://blog.rocketinsights.com/best-practices-for-terraform-aws-tags/
  default_tags {
    tags = {
      project     = var.project_name
      app-id      = var.app_name
      environment = var.environment
      owner       = "Jirawat Uttayaya"

      // This regex results in the terraform git
      // repo name and any sub-directories.
      terraform-base-path = replace(path.cwd, "/^.*?(${var.project_name}\\/)/", "$1")
    }
  }
}
