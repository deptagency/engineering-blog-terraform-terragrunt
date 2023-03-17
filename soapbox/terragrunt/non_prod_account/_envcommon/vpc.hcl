# This is the common component configuration for vpc in non-prod environments (dev, qa).

# Locals are named constants that are reusable within the configuration.
locals {
  # Load common.hcl to get base_module_source_url
  # Unfortunately a bit of duplication with the root terragrunt.hcl locals
  # since Terragrunt does not let the child terragrunt.hcl access the parent locals block
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the terraform block in the child Terragrunt configurations.
  base_module_source_url = local.common_vars.locals.base_module_source_url
  module_source_url = "${local.base_module_source_url}/simple_vpc"
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder. If any environment
# needs to deploy a different module version, it should redefine this block with a different ref to override the
# deployed version.
terraform {
  # No need to uncomment anything for local development
  # terragrunt apply --terragrunt-source=../../../../..//modules/simple_vpc
  #source = "${local.module_source_url}?ref=main"
  source = "../../../../..//modules/simple_vpc"
}
