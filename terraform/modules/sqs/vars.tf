variable "name" {
  description = "Nome da fila SQS"
  type        = string
}

variable "visibility_timeout_seconds" {
  description = "Tempo em que uma mensagem fica invisível após ser recebida"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "Tempo de retenção das mensagens"
  type        = number
  default     = 345600
}

variable "max_receive_count" {
  description = "Quantidade máxima de tentativas antes de enviar para a DLQ"
  type        = number
  default     = 4
}