module "redis" {
  source = "./modules/redis"

  name = "tooglemaster-redis"

  vpc_id   = module.network.vpc_id
  vpc_cidr = module.network.vpc_cidr

  subnet_ids = module.network.private_subnet_ids

  node_type = "cache.t4g.micro"
  port      = 6379
}