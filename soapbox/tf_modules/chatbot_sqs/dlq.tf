# Dead Letter Queue
resource "aws_sqs_queue" "dlq" {
  content_based_deduplication = var.content_based_deduplication
  deduplication_scope         = var.deduplication_scope
  delay_seconds               = var.delay_seconds
  # If source queue is FIFO, DLQ must also be FIFO and vice versa
  fifo_queue                        = var.fifo_queue
  fifo_throughput_limit             = var.fifo_throughput_limit
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.kms_master_key_id
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  name                              = local.dlq_name
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  sqs_managed_sse_enabled           = var.kms_master_key_id != null ? null : var.sqs_managed_sse_enabled
  visibility_timeout_seconds        = var.visibility_timeout_seconds

  tags = var.tags
}

# DLQ Policy
#data "aws_iam_policy_document" "dlq" {
#  statement {
#    effect    = "Allow"
#    resources = [aws_sqs_queue.dlq.arn]
#    actions = [
#      "sqs:ChangeMessageVisibility",
#      "sqs:DeleteMessage",
#      "sqs:GetQueueAttributes",
#      "sqs:GetQueueUrl",
#      "sqs:ListQueueTags",
#      "sqs:ReceiveMessage",
#      "sqs:SendMessage",
#    ]
#    principals {
#      type        = "AWS"
#      identifiers = [data.aws_caller_identity.current.account_id]
#    }
#  }
#}
#
#resource "aws_sqs_queue_policy" "dlq" {
#  queue_url = aws_sqs_queue.dlq.url
#  policy    = data.aws_iam_policy_document.dlq.json
#}
