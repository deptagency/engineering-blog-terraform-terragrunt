# /GET hello-time-ems
resource "aws_api_gateway_resource" "hello_time_ems" {
  parent_id   = aws_api_gateway_rest_api.serverless_demo.root_resource_id
  path_part   = "hello-time-ems"
  rest_api_id = aws_api_gateway_rest_api.serverless_demo.id
}

resource "aws_api_gateway_method" "hello_time_ems" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.hello_time_ems.id
  rest_api_id   = aws_api_gateway_rest_api.serverless_demo.id
}

resource "aws_api_gateway_integration" "hello_time_ems" {
  resource_id = aws_api_gateway_resource.hello_time_ems.id
  rest_api_id = aws_api_gateway_rest_api.serverless_demo.id

  http_method             = aws_api_gateway_method.hello_time_ems.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.hello_time_ems.invoke_arn
}
