resource "aws_lambda_function" "hello_time_ems" {
  function_name    = local.lambda_name_hello_time_ems
  filename         = data.archive_file.lambda_hello_time_ems.output_path
  package_type     = "Zip"
  source_code_hash = data.archive_file.lambda_hello_time_ems.output_base64sha256

  architectures = ["x86_64"]
  handler       = "index.handler"
  runtime       = "nodejs22.x"
  role          = aws_iam_role.lambda_hello_time_ems.arn

  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.lambda_hello_time_ems.name
  }
}

data "archive_file" "lambda_hello_time_ems" {
  type             = "zip"
  output_path      = "${local.lambda_zip_dir}/${local.lambda_name_hello_time_ems}.zip"
  output_file_mode = "0666"
  source_dir       = "../lambda_src/hello_time_esm"
}

resource "aws_cloudwatch_log_group" "lambda_hello_time_ems" {
  name              = "/aws/lambda/${local.lambda_name_hello_time_ems}"
  retention_in_days = 1
}
