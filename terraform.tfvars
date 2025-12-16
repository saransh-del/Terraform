region      = "us-east-1"
environment = "dev"

# VPC
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"

private_subnet_cidrs = [
  "10.0.2.0/24",
  "10.0.3.0/24"
]

# EC2
ami_id           = "ami-0ecb62995f68bb549"
instance_type    = "t2.micro"
key_name         = "terraform-key"
public_key_path  = "./terraform-key.pub"
allowed_ssh_cidr = "0.0.0.0/0"

# RDS
db_name           = "appdb"
db_username       = "admin"
db_password       = "StrongPassword123"
db_instance_class = "db.t3.micro"
engine            = "mysql"
engine_version    = "8.0"
allocated_storage = 20

# S3
bucket_name = "terraform-dev-bucket-123456"
