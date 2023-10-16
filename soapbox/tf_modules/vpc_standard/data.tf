# ----------------------------------------------------------------------------------------------------------------------
# General-purpose data lookups for existing core infrastructure utilized throughout the module
# ----------------------------------------------------------------------------------------------------------------------

data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}