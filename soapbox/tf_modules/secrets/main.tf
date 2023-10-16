# ----------------------------------------------------------------------------------------------------------------------
# AWS Secrets Manager resources
# ----------------------------------------------------------------------------------------------------------------------

# Note: manually put in directus key and secret so we don't
# put the values in GitHub
resource "aws_secretsmanager_secret" "directus_key" {
  name = local.directus_key
}

resource "aws_secretsmanager_secret" "directus_secret" {
  name = local.directus_secret
}

resource "aws_secretsmanager_secret" "directus_admin_password" {
  name = local.directus_admin_password
}

resource "aws_secretsmanager_secret" "directus_static_token" {
  name = local.directus_static_token
}
