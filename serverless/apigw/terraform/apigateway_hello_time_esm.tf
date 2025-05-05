# /GET hello-time-esm
resource "aws_api_gateway_resource" "hello_time_esm" {
  parent_id   = aws_api_gateway_rest_api.serverless_demo.root_resource_id
  path_part   = "hello-time-esm"
  rest_api_id = aws_api_gateway_rest_api.serverless_demo.id
}

resource "aws_api_gateway_method" "hello_time_esm" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.hello_time_esm.id
  rest_api_id   = aws_api_gateway_rest_api.serverless_demo.id
}

resource "aws_api_gateway_integration" "hello_time_esm" {
  resource_id = aws_api_gateway_resource.hello_time_esm.id
  rest_api_id = aws_api_gateway_rest_api.serverless_demo.id

  http_method             = aws_api_gateway_method.hello_time_esm.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.hello_time_esm.invoke_arn
}
