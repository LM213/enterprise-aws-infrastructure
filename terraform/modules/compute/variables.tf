variable "public_subnet_id" {
  description = "Public subnet ID for EC2 deployment"
  type        = string
}

variable "app_security_group_id" {
  description = "Application security group ID"
  type        = string
}