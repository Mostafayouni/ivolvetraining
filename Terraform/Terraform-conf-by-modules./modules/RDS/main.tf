provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "my_rds_instance" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "my_secure_password"
  publicly_accessible = false
  multi_az             = true
  db_subnet_group_name = "my-db-subnet-group"
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.subnet_ids
}
