resource "aws_sns_topic" "sns_secure" {
  name                       = var.sns_name
  display_name               = var.sns_name
  delivery_policy = <<EOF
  {
    "http": {
        "defaultHealthyRetryPolicy": {
          "minDelayTarget": 1,
          "maxDelayTarget": 60,
          "numRetries": 50,
          "numNoDelayRetries": 3,
          "numMinDelayRetries": 2,
          "numMaxDelayRetries": 35,
          "backoffFunction": "exponential"
        },
        "defaultThrottlePolicy": {
          "maxReceivesPerSecond": 10
        },
        "disableSubscriptionOverrides": false
    }
  }
  EOF
  kms_master_key_id = "alias/aws/sns"
  fifo_topic                 = false

  tags = var.tags
}
