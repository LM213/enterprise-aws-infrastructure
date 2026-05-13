variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS database"
  type        = list(string)
}
variable "vpc_id" {
  description = "VPC ID where database resources will be created"
  type        = string
}
variable "db_username" {
  description = "Database admin username"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}
variable "app_security_group_id" {
  description = "Application security group allowed to connect to the database"
  type        = string
}