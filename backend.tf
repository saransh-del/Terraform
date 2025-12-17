terraform {
  backend "s3" {
    bucket         = "terraform-state-saransh4326"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    assume_role {
      role_arn = "arn:aws:iam::353284254141:role/TerraformStateBackendRole"
    }
  }
}

