variable "aws_region" {
  description = "AWS region where project resources will be deployed"
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
variable "private_subnet_2_cidr" {
  type = string
}

variable "availability_zone_2" {
  type = string
}
variable "alert_email" {
  description = "Email address that will receive CloudWatch alert notifications"
  type        = string
}