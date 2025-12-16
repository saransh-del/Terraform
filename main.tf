resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh
}


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ec2" {
  source = "./modules/ec2"

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  subnet_id        = module.vpc.public_subnet_id
  vpc_id           = module.vpc.vpc_id
  key_name         = aws_key_pair.keypair.key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "rds" {
  source = "./modules/rds"

  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
  engine            = var.engine
  engine_version    = var.engine_version
  allocated_storage = var.allocated_storage
  subnet_ids        = module.vpc.private_subnet_ids
  vpc_id            = module.vpc.vpc_id
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
  environment = var.environment
}
