terraform {
  backend "s3" {
    bucket         = "novara-terraform-state-150502622892"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "novara-terraform-locks"
    encrypt        = true
  }
}
