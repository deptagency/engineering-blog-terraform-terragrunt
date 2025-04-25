data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "AWSLambdaBasicExecutionRole" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role" "lambda_hello_time_ems" {
  name = "${local.lambda_name_hello_time_ems}-role"

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_hello_time_ems_basic_execution_role" {
  role       = aws_iam_role.lambda_hello_time_ems.name
  policy_arn = data.aws_iam_policy.AWSLambdaBasicExecutionRole.arn
}
