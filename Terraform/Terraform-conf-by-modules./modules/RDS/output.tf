output "rds_instance_id" {
  description = "The ID of the newly created RDS instance"
  value       = aws_db_instance.my_rds_instance.id
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.my_rds_instance.endpoint
}

output "rds_username" {
  description = "The username for accessing the RDS instance"
  value       = aws_db_instance.my_rds_instance.username
}

output "rds_password" {
  description = "The password for accessing the RDS instance"
  sensitive   = true
  value       = aws_db_instance.my_rds_instance.password
}
