variable "name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets privadas utilizadas pelo EKS"
  type        = list(string)
}

variable "role_arn" {
  description = "ARN da LabRole do AWS Academy"
  type        = string
}

variable "node_instance_types" {
  description = "Tipos de instância dos nodes"
  type        = list(string)

  default = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Quantidade desejada de nodes"
  type        = number

  default = 2
}

variable "node_min_size" {
  description = "Quantidade mínima de nodes"
  type        = number

  default = 1
}

variable "node_max_size" {
  description = "Quantidade máxima de nodes"
  type        = number

  default = 3
}