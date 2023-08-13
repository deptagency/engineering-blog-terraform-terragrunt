resource "aws_sqs_queue" "sqs_secure_dlq" {
  name                       = "${var.sqs_name}-dlq"
  fifo_queue                 = false
  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600
  max_message_size           = 262144
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
  sqs_managed_sse_enabled    = true

  tags = var.tags
}

resource "aws_sqs_queue" "sqs_secure" {
  name                       = var.sqs_name
  fifo_queue                 = false
  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600
  max_message_size           = 262144
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
  sqs_managed_sse_enabled    = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_secure_dlq.arn
    maxReceiveCount     = 3
  })

  tags = var.tags
}
