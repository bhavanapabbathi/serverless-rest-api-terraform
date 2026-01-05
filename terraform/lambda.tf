data "archive_file" "create_zip" {
  type        = "zip"
  source_file = "../lambda/create_item.py"
  output_path = "create.zip"
}

resource "aws_lambda_function" "create" {
  function_name = "create-item"
  role          = aws_iam_role.lambda_role.arn
  handler       = "create_item.lambda_handler"
  runtime       = "python3.9"
  filename      = data.archive_file.create_zip.output_path
}
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
}
