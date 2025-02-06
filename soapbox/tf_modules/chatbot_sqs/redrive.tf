# Re-drive Policy
resource "aws_sqs_queue_redrive_policy" "dlq" {
  queue_url = aws_sqs_queue.this.url
  redrive_policy = jsonencode(
    merge(
      {
        deadLetterTargetArn = aws_sqs_queue.dlq.arn
        maxReceiveCount     = 5
      },
      var.redrive_policy
    )
  )
}
