output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR da VPC"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}