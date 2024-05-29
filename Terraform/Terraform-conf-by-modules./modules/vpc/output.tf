output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}
