variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]  # Example CIDR blocks for two subnets
}

variable "db_instance_username" {
  description = "Username for the database instances"
  default     = "admin"
}

variable "db_instance_password" {
  description = "password"
  
}

variable "ec2_instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0ee3dd41c47751fe6"  # Example AMI ID, replace with your desired AMI
}
