variable "subnet_ids" {
  description = "List of subnet IDs for RDS instance"
  type        = list(string)
  default     = ["subnet-0f7dc8c52dba8ec64"]  # Replace with your subnet IDs
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gibibytes (GiB)"
  type        = number
}

variable "rds_engine" {
  description = "The name of the database engine to be used for RDS instance"
  type        = string
}

variable "rds_instance_class" {
  description = "The instance type to use for RDS instance"
  type        = string
}

variable "rds_instance_name" {
  description = "The name of the RDS instance"
  type        = string
}

variable "rds_username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "rds_password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group for RDS instance"
  type        = string
}
