# Includes the root terragrunt.hcl configurations
include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component.
# The _envcommon/iam.hcl configuration contains App EC2 settings
# that are common across all environments (dev, qa, prod).
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/app_ec2.hcl"
  expose = true
}
