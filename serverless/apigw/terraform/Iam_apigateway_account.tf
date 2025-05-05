resource "aws_iam_role" "apigateway_cloudwatch_global" {
  name               = "api_gateway_cloudwatch_global"
  assume_role_policy = data.aws_iam_policy_document.assume_role_apigw.json
}

data "aws_iam_policy_document" "assume_role_apigw" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy" "AmazonAPIGatewayPushToCloudWatchLogs" {
  name = "AmazonAPIGatewayPushToCloudWatchLogs"
}

resource "aws_iam_role_policy_attachment" "apigateway_cloudwatch_global" {
  role       = aws_iam_role.apigateway_cloudwatch_global.name
  policy_arn = data.aws_iam_policy.AmazonAPIGatewayPushToCloudWatchLogs.arn
}

resource "aws_api_gateway_account" "apigateway_cloudwatch_global" {
  cloudwatch_role_arn = aws_iam_role.apigateway_cloudwatch_global.arn
}
