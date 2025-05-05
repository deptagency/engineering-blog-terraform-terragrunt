resource "aws_api_gateway_rest_api" "serverless_demo" {
  name        = "${local.app_prefix}-serverless-demo"
  description = "DEPT engineering blog serverless demo"
}

resource "aws_api_gateway_deployment" "serverless_demo" {
  rest_api_id = aws_api_gateway_rest_api.serverless_demo.id

  depends_on = [
    aws_api_gateway_integration.hello_time_ems,
  ]

  # Redeployment based on Terraform resource sha1 hash
  # can sometimes trigger the bug
  # "Error: Provider produced inconsistent final plan"
  # TF file sha1 triggers redeployment when this file changes
  triggers = {
    redeployment = join("",
      [
        filesha1("./apigateway.tf"),
        filesha1("./apigateway_hello_time_ems.tf"),
      ]
    )
  }
}

resource "aws_cloudwatch_log_group" "apigw_serverless_demo" {
  name              = "/aws/apigateway/${aws_api_gateway_rest_api.serverless_demo.name}-v1"
  retention_in_days = 14
}

resource "aws_api_gateway_stage" "serverless_demo_v1" {
  deployment_id = aws_api_gateway_deployment.serverless_demo.id
  rest_api_id   = aws_api_gateway_rest_api.serverless_demo.id
  stage_name    = "v1"

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.apigw_serverless_demo.arn

    format = jsonencode({
      context = {
        domainName              = "$context.domainName"
        integrationErrorMessage = "$context.integrationErrorMessage"
        protocol                = "$context.protocol"
        requestId               = "$context.requestId"
        requestTime             = "$context.requestTime"
        responseLength          = "$context.responseLength"
        routeKey                = "$context.routeKey"
        stage                   = "$context.stage"
        status                  = "$context.status"
        error = {
          message      = "$context.error.message"
          responseType = "$context.error.responseType"
        }
        identity = {
          sourceIP = "$context.identity.sourceIp"
        }
        integration = {
          error             = "$context.integration.error"
          integrationStatus = "$context.integration.integrationStatus"
        }
      }
    })
  }

  depends_on = [ aws_api_gateway_account.apigateway_cloudwatch_global ]
}

resource "aws_api_gateway_method_settings" "serverless_demo" {
  rest_api_id = aws_api_gateway_rest_api.serverless_demo.id
  stage_name  = aws_api_gateway_stage.serverless_demo_v1.stage_name
  method_path = "*/*"
  settings {
    logging_level      = "INFO"
    data_trace_enabled = true
    metrics_enabled    = true
  }
}
