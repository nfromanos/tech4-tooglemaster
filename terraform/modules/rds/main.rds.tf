resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group for PostgreSQL"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "postgres" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = var.vpc_cidr
  from_port   = 5432
  to_port     = 5432
  ip_protocol = "tcp"
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier = var.name

  allocated_storage = 20
  storage_type      = "gp3"

  engine         = "postgres"
  engine_version = "16"

  instance_class = "db.t3.micro"

  db_name  = var.database_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]

  publicly_accessible = false

  skip_final_snapshot = true
}