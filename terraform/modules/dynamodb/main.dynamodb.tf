resource "aws_dynamodb_table" "this" {
  name         = var.name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags = {
    Name = var.name
  }
}