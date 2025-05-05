resource "aws_lambda_function" "hello_time_esm" {
  function_name    = local.lambda_name_hello_time_esm
  filename         = data.archive_file.lambda_hello_time_esm.output_path
  package_type     = "Zip"
  source_code_hash = data.archive_file.lambda_hello_time_esm.output_base64sha256

  architectures = ["x86_64"]
  handler       = "index.handler"
  runtime       = "nodejs22.x"
  role          = aws_iam_role.lambda_hello_time_esm.arn

  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.lambda_hello_time_esm.name
  }
}

data "archive_file" "lambda_hello_time_esm" {
  type             = "zip"
  output_path      = "${local.lambda_zip_dir}/${local.lambda_name_hello_time_esm}.zip"
  output_file_mode = "0666"
  source_dir       = "../lambda_src/hello_time_esm"
}

resource "aws_cloudwatch_log_group" "lambda_hello_time_esm" {
  name              = "/aws/lambda/${local.lambda_name_hello_time_esm}"
  retention_in_days = 1
}
