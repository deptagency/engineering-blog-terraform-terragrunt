# This is the common component configuration for vpc in non-prod environments (dev, qa).

# Locals are named constants that are reusable within the configuration.
locals {
  # Unfortunately a bit of duplication with the root terragrunt.hcl locals
  # since Terragrunt does not let an "include" file access another "include" file
  # Automatically load and merge config
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  # Automatically load environment scoped variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load AWS region scoped variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Merge all the variables to allow overriding local variables
  merged_local_vars = merge (
    local.common_vars.locals,
    local.env_vars.locals,
    local.region_vars.locals
  )

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the terraform block in the child Terragrunt configurations.
  base_module_source_url = local.merged_local_vars.base_module_source_url
  module_name = "simple_s3"
  module_source_url = "${local.base_module_source_url}/${local.module_name}"

  bucket_name = "${local.merged_local_vars.environment_name}-${local.merged_local_vars.app_id}-bucket"
}

inputs = {
  bucket_name = local.bucket_name
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder. If any environment
# needs to deploy a different module version, it should redefine this block with a different ref to override the
# deployed version.
terraform {
  # For dev and local development, it is convenient to use local directories for modules
  # source = "../../../../..//modules/${local.module_name}"
  source = "${local.module_source_url}?ref=main"
}
