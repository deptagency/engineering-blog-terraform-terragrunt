# Includes the root terragrunt.hcl configurations
include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component. The _envcommon/vpc.hcl configuration contains VPC settings
# that are common across all non-prod environments (dev, qa).
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/s3.hcl"
  expose = true
}