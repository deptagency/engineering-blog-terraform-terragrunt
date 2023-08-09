# Includes the root terragrunt.hcl configurations
include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component.
# The _envcommon/s3.hcl configuration contains S3 settings
# that are common across all environments (dev, qa, prod).
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/../_envcommon/s3.hcl"
  expose = true
}

terraform {
  # For dev and local development, it is OK to use local directories for modules
  # We override this for qa and prod env to use git tags for versioning
  source = "${include.envcommon.locals.module_source_url}?ref=v1.5.0"
}
