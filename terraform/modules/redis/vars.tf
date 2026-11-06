variable "name" {
  description = "Nome do Redis"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets privadas"
  type        = list(string)
}

variable "node_type" {
  description = "Tipo da instância do Redis"
  type        = string
  default     = "cache.t4g.micro"
}

variable "port" {
  description = "Porta do Redis"
  type        = number
  default     = 6379
}