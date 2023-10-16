# ----------------------------------------------------------------------------------------------------------------------
# General-use local variables
# Locals are useful for combining other variables and expressions to avoid repeating throughout.
# ----------------------------------------------------------------------------------------------------------------------

locals {
  directus_name           = "directus"
  directus_key            = "${var.app_id}-${local.directus_name}-key-${var.environment_name}"
  directus_secret         = "${var.app_id}-${local.directus_name}-secret-${var.environment_name}"
  directus_admin_password = "${var.app_id}-${local.directus_name}-admin-password-${var.environment_name}"
  directus_static_token   = "${var.app_id}-${local.directus_name}-static-token-${var.environment_name}"
}