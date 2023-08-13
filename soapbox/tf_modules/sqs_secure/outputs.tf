# ----------------------------------------------------------------------------------------------------------------------
# Module outputs
# ----------------------------------------------------------------------------------------------------------------------

output "sqs_secure_arn" {
  value = aws_sqs_queue.sqs_secure.arn
}

output "sqs_secure" {
  value = aws_sqs_queue.sqs_secure
}

output "sqs_secure_dlq_arn" {
  value = aws_sqs_queue.sqs_secure_dlq.arn
}

output "sqs_secure_dlq" {
  value = aws_sqs_queue.sqs_secure_dlq
}
