# This is the common component configuration for IAM

# Locals are named constants that are reusable within the configuration.
locals {
  # Unfortunately a bit of duplication with the root terragrunt.hcl locals
  # since Terragrunt does not let an "include" file access another "include" file
  # Automatically load and merge config
  common_vars = read_terragrunt_config(find_in_parent_folders("_envcommon/common.hcl"))

  # Automatically load environment scoped variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Merge all the variables to allow overriding local variables
  merged_local_vars = merge(
    local.common_vars.locals,
    local.env_vars.locals,
  )

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the terraform block in the child Terragrunt configurations.
  base_module_source_url       = local.merged_local_vars.base_module_source_url
  base_module_source_local_dir = local.merged_local_vars.base_module_source_local_dir
  module_name                  = "app_iam"
  module_source_url            = "${local.base_module_source_url}/${local.module_name}"
  module_source_local          = "${local.base_module_source_local_dir}/${local.module_name}"

  # S3 bucket Terragrunt path for dependency and dependencies block
  s3_terragrunt_path = "${get_original_terragrunt_dir()}/../s3"
}

# Terragrunt dependency and dependencies blocks are different.
# The dependency block is for using the output values of a dependent Terragrunt module
# https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/#passing-outputs-between-modules
# The dependencies block is to ensure Terragrunt run-all executes the apply in the correct module order
# https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/#dependencies-between-modules
dependency "lookup_s3_module" {
  config_path = "${local.s3_terragrunt_path}"

  # Mock outputs are for when the state of the dependency module is not created yet
  # This way "terragrunt validate" will not fail from missing state
  mock_outputs = {
    id = "mock-s3-bucket-name"
  }
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs_merge_with_state           = true
  skip_outputs                            = false
}

# overriding the inputs value from the root env.hcl
# This is an example of both using the above dependency block outputs and
# overriding the inputs value from the root terragrunt.hcl
inputs = {
  tags = local.merged_local_vars.iam_tags
  bucket_name = dependency.lookup_s3_module.outputs.id
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder. If any environment
# needs to deploy a different module version, it should redefine this block with a different ref to override the
# deployed version.
terraform {
  # For dev and local development, it is OK to use local directories for modules
  # We will override this for qa and prod env to use git tags
  source = local.module_source_local
}


# The IAM module is dependent on the S3 module completing first
# By defining dependencies, Terragrunt run-all will run the Terraform modules in the correct order.
# Without Terragrunt, you would have to hard-code the execution order of the Terraform module
# in a Bash script
dependencies {
  paths = ["${local.s3_terragrunt_path}"]
}