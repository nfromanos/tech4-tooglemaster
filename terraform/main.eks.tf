module "eks" {
  source = "./modules/eks"

  name = "tooglemaster-cluster"

  kubernetes_version = "1.36"

  role_arn = var.lab_role_arn

  vpc_id = module.network.vpc_id

  subnet_ids = module.network.private_subnet_ids

  node_instance_types = [
    "t3.medium"
  ]

  node_desired_size = 2
  node_min_size     = 1
  node_max_size     = 3
}