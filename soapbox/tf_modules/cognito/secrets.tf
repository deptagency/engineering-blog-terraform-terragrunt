# Google OAuth2 Client ID for Cognito Provider
resource "aws_secretsmanager_secret" "cognito_google_client_id" {
  name = "${local.user_pool_fullname}-google-client-id"
  tags = var.tags
}


resource "aws_secretsmanager_secret_version" "cognito_google_client_id" {
  secret_id = aws_secretsmanager_secret.cognito_google_client_id.id
  secret_string = "ENTER_GOOGLE_CLIENT_ID_IN_AWS_UI"

  # Never ever update the password from terraform if already set
  lifecycle {
    ignore_changes = [
      secret_string,
      version_stages
    ]
  }

  version_stages = [
    "AWSCURRENT"
  ]
}

data "aws_secretsmanager_secret_version" "cognito_google_client_id" {
  depends_on = [aws_secretsmanager_secret_version.cognito_google_client_id]
  secret_id  = aws_secretsmanager_secret.cognito_google_client_id.id
}

# Google OAuth2 Client Secret for Cognito Provider
resource "aws_secretsmanager_secret" "cognito_google_client_secret" {
  name = "${local.user_pool_fullname}-google-client-secret"
  tags = var.tags
}


resource "aws_secretsmanager_secret_version" "cognito_google_client_secret" {
  secret_id = aws_secretsmanager_secret.cognito_google_client_secret.id
  secret_string = "ENTER_GOOGLE_CLIENT_SECRET_IN_AWS_UI"

  # Never ever update the password from terraform if already set
  lifecycle {
    ignore_changes = [
      secret_string,
      version_stages
    ]
  }

  version_stages = [
    "AWSCURRENT"
  ]
}

data "aws_secretsmanager_secret_version" "cognito_google_client_secret" {
  depends_on = [aws_secretsmanager_secret_version.cognito_google_client_secret]
  secret_id  = aws_secretsmanager_secret.cognito_google_client_secret.id
}
