# backend.tf
terraform {
  backend "s3" {
    bucket         = "tech3-terraform-init"    # Nome do bucket S3
    key            = "terraform.tfstate" # Caminho do arquivo state
    region         = "us-east-1"
    use_lockfile   = "true"
    encrypt        = true                            # Ativa criptografia
  }
}