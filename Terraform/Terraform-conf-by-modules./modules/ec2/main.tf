# modules/ec2/main.tf
resource "aws_instance" "my_ec2_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.subnet_id
}
