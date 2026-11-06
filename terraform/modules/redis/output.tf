output "endpoint" {
  description = "Endpoint do Redis"
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "port" {
  description = "Porta do Redis"
  value       = var.port
}

output "security_group_id" {
  description = "ID do Security Group do Redis"
  value       = aws_security_group.this.id
}

output "subnet_group_name" {
  description = "Nome do subnet group"
  value       = aws_elasticache_subnet_group.this.name
}