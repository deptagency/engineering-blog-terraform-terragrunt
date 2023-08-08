# Includes the root terragrunt.hcl configurations
include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component.
# The _envcommon/vpc.hcl configuration contains VPC settings
# that are common across all environments (dev, qa, prod).
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/vpc.hcl"
  expose = true
}

terraform {
  # For dev and local development, it is OK to use local directories for modules
  # We override this for qa and prod env to use git tags for versioning
  source = "${include.envcommon.locals.module_source_url}?ref=v1.0.0"
}
