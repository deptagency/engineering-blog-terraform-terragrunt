resource "aws_cognito_user_pool" "this" {
  name = var.user_pool_name
  auto_verified_attributes = [
    "email",
  ]
  username_attributes = [
    "email",
  ]
  account_recovery_setting {
    recovery_mechanism {
      name     = "admin_only"
      priority = 1
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  deletion_protection = "ACTIVE"
  # domain              = "jirawat"
  mfa_configuration = "OPTIONAL"

  password_policy {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }

  software_token_mfa_configuration {
    enabled = true
  }

  user_attribute_update_settings {
    attributes_require_verification_before_update = [
      "email",
    ]
  }

  username_configuration {
    case_sensitive = false
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }

  tags = var.tags
}

resource "aws_cognito_identity_provider" "this" {
  depends_on = [
    aws_secretsmanager_secret_version.cognito_google_client_id,
    aws_secretsmanager_secret_version.cognito_google_client_secret
  ]
  user_pool_id  = aws_cognito_user_pool.this.id
  provider_name = "Google"
  provider_type = "Google"

  provider_details = {
    authorize_scopes = "email"
    client_id        = data.aws_secretsmanager_secret_version.cognito_google_client_id.secret_string
    client_secret    = data.aws_secretsmanager_secret_version.cognito_google_client_secret.secret_string
  }

  attribute_mapping = {
    email = "email"
  }
}