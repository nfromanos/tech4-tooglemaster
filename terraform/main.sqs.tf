module "sqs" {
  source = "./modules/sqs"

  name = "tooglemaster-sqs"

  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600
  max_receive_count          = 4
}