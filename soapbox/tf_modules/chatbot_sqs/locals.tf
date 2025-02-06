locals {
  sqs_root_name = try(trimsuffix(var.name, ".fifo"), "")
  sqs_name      = var.fifo_queue ? "${local.sqs_root_name}.fifo" : local.sqs_root_name
  dlq_name      = var.fifo_queue ? "${local.sqs_name}-dlq.fifo" : "${local.sqs_name}-dlq"
}
