resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group for Redis"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "redis" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = var.vpc_cidr
  from_port   = var.port
  to_port     = var.port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id = var.name
  description           = "Redis for ${var.name}"

  engine    = "redis"
  node_type = var.node_type

  num_cache_clusters = 1

  port = var.port

  subnet_group_name  = aws_elasticache_subnet_group.this.name
  security_group_ids = [aws_security_group.this.id]

  automatic_failover_enabled = false

  tags = {
    Name = var.name
  }
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnet-group"
  }
}