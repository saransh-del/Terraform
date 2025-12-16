terraform {
  backend "s3" {
    bucket  = "terraform-state-saransh"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    
    use_lockfile = true
  }
}
