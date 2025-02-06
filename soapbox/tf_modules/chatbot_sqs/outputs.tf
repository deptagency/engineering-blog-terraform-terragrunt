# Queue
output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.this.id
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.this.arn
}

output "queue_arn_static" {
  description = "The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${local.sqs_name}"
}

output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.this.url
}

output "queue_name" {
  description = "The name of the SQS queue"
  value       = aws_sqs_queue.this.name
}

# Dead Letter Queue
output "dead_letter_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.dlq.id
}

output "dead_letter_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.dlq.arn
}

output "dead_letter_queue_arn_static" {
  description = "The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${local.dlq_name}"
}

output "dead_letter_queue_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.dlq.url
}

output "dead_letter_queue_name" {
  description = "The name of the SQS queue"
  value       = aws_sqs_queue.dlq.name
}
