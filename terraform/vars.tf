variable "db_password" {
  description = "postgres"
  type        = string
  sensitive   = true
}

variable "lab_role_arn" {
  description = "ARN da LabRole fornecida pelo AWS Academy"
  type        = string
}