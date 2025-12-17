terraform {
  backend "s3" {
    bucket         = "terraform-state-saransh4326"
    key            = "terraform-2/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    role_arn       = "arn:aws:iam::353284254141:role/TerraformStateBackendRole"
  }
}

