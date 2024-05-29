provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "../modules/vpc"

  vpc_cidr_block          = "10.0.0.0/16"
  public_subnet_cidr_block = "10.0.1.0/24"
  availability_zone        = "us-west-2a"
}

module "ec2" {
  source = "../modules/ec2"

  ec2_ami           = "ami-0ee3dd41c47751fe6"  # Your specified AMI ID
  ec2_instance_type = "t2.micro"
  subnet_id         = module.vpc.public_subnet_id
}

module "rds" {
  source = "../modules/rds"

  rds_allocated_storage    = 20
  rds_engine               = "mysql"
  rds_instance_class       = "db.t2.micro"
  rds_instance_name        = "my-rds-instance"
  rds_username             = "admin"
  rds_password             = "password123"
  db_subnet_group_name     = "default"  # Use default subnet group to place in a specific subnet
}

