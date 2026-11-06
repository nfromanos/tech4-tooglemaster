output "queue_id" {
  description = "ID da fila SQS"
  value       = aws_sqs_queue.this.id
}

output "queue_arn" {
  description = "ARN da fila SQS"
  value       = aws_sqs_queue.this.arn
}

output "queue_url" {
  description = "URL da fila SQS"
  value       = aws_sqs_queue.this.url
}

output "deadletter_queue_arn" {
  description = "ARN da Dead Letter Queue"
  value       = aws_sqs_queue.deadletter.arn
}

output "deadletter_queue_url" {
  description = "URL da Dead Letter Queue"
  value       = aws_sqs_queue.deadletter.url
}