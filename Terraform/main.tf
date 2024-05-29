provider "aws" {
  region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Define valid availability zones for the region
variable "valid_azs" {
  default = ["a", "b", "c", "d", "e", "f"]
}

# Create private subnets within the VPC
resource "aws_subnet" "private_subnets" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = "${var.aws_region}${var.valid_azs[count.index]}"  # Assign subnets to valid AZs sequentially
}

# Create a public subnet within the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/24"  # Adjust the CIDR block as needed
  availability_zone = "${var.aws_region}a"  # Use the first AZ for the public subnet
}

# Create a security group allowing access to RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.my_vpc.id

  # Define your ingress rules here
}

# Create DB subnet groups covering multiple AZs
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = aws_subnet.private_subnets[*].id
}

# Create RDS instances in each private subnet
resource "aws_db_instance" "rds_instances" {
  count                = length(var.subnet_cidr_blocks)
  identifier           = "rds-instance-${count.index + 1}"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"  # Change to desired DB engine
  engine_version       = "5.7"    # Change to desired DB engine version
  instance_class       = "db.t3.micro"  # Change to a supported instance type
  username             = var.db_instance_username
  password             = var.db_instance_password
  publicly_accessible  = false
  multi_az             = false
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  # Additional configurations as needed
}

# Launch an EC2 instance in the public subnet
resource "aws_instance" "my_ec2_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.public_subnet.id  # Place the EC2 instance in the public subnet

  # Additional configurations as needed
}
