variable "storage_account_names" {
  type    = list(string)
  default = ["analytics-service", "auth-service", "evaluation-service", "flag-service", "targeting-service"]
}

module "ecr" {
  source = "./modules/ecr"
  for_each  = toset(var.storage_account_names)
  
  name = each.value
  
}