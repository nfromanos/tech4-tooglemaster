resource "aws_sqs_queue" "deadletter" {
  name = "${var.name}-deadletter"

  message_retention_seconds = var.message_retention_seconds

  tags = {
    Name = "${var.name}-deadletter"
  }
}

resource "aws_sqs_queue" "this" {
  name = var.name

  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.deadletter.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = {
    Name = var.name
  }
}