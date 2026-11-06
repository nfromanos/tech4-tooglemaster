output "vpc_id" {
  value = module.network.vpc_id
}

output "ecr_repository_urls" {
  description = "URL de cada repositório ECR, por serviço"
  value       = { for name, repo in module.ecr : name => repo.repository_url }
}

output "rds-auth-service-endpoint" {
  value = module.rds-auth-service.endpoint
}

output "rds-flag-service-endpoint" {
  value = module.rds-flag-service.endpoint
}

output "rds-targeting-service-endpoint" {
  value = module.rds-targeting-service.endpoint
}

output "redis_endpoint" {
  value = module.redis.endpoint
}

output "sqs_queue_url" {
  description = "URL da fila SQS"
  value       = module.sqs.queue_url
}

output "sqs_queue_arn" {
  description = "ARN da fila SQS"
  value       = module.sqs.queue_arn
}

output "sqs_deadletter_queue_arn" {
  description = "ARN da DLQ"
  value       = module.sqs.deadletter_queue_arn
}