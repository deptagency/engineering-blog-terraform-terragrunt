# In a professional setting, a hard-pin of terraform and provider versions ensures all
# team members use the same version, reducing state conflict.
# A hard-pin also prevents unexpected upgrades of the providers, which may lead to incompatibilities or bugs
terraform {
  required_version = "1.4.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.59.0"
    }
  }

  # See README.md for usage
  # Note: Terraform does not allow usage of variables in the backend config
  //  backend "s3" {
  //    bucket         = "dev-terraform-soapbox-tfstate-s3"
  //    region         = "us-east-2"
  //    key            = "terraform/non_prod_account/dev/terraform_infra/terraform.tfstate"
  //    dynamodb_table = "dev-terraform-soapbox-tfstate-dynamodb"
  //    encrypt        = true
  //  }
}

provider "aws" {
  region = var.aws_region

  # See info about default_tags at
  # https://blog.rocketinsights.com/best-practices-for-terraform-aws-tags/
  default_tags {
    tags = {
      project     = var.project_name
      app-id      = var.app_id
      environment = var.environment_name

      # This regex results in the terraform git repo name and any sub-directories.
      # For this repo, terraform-base-path is
      # engineering-blog-terraform-terragrunt/soapbox/terraform/dev/terraforn_infra
      # This tag helps AWS UI users discover what
      # Terraform git repo and directory to modify
      terraform-base-path = replace(path.cwd, "/^.*?(${local.git_repo_name}\\/)/", "$1")
    }
  }
}
