module "rds-auth-service" {
  source = "./modules/rds"
  
  name = "auth-service-postgres"

  subnet_ids = module.network.private_subnet_ids
  vpc_id = module.network.vpc_id
  vpc_cidr = module.network.vpc_cidr

  database_name = "authService"
  username      = "postgres"
  password      = "postgres"
}

module "rds-flag-service" {
  source = "./modules/rds"
  
  name = "flag-service-postgres"

  subnet_ids = module.network.private_subnet_ids
  vpc_id = module.network.vpc_id
  vpc_cidr = module.network.vpc_cidr

  database_name = "flagService"
  username      = "postgres"
  password      = "postgres"
}

module "rds-targeting-service" {
  source = "./modules/rds"
  
  name = "targeting-service-postgres"

  subnet_ids = module.network.private_subnet_ids
  vpc_id = module.network.vpc_id
  vpc_cidr = module.network.vpc_cidr

  database_name = "targetingService"
  username      = "postgres"
  password      = "postgres"
}