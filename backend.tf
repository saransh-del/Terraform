terraform {
  backend "s3" {
    bucket  = "terraform-state-saransh4326"
    key     = "terraform-2/dev/terraform.tfstate"
    region  = "us-east-1"
    profile = "terraform-backend"
    use_lockfile = true
  }
}
