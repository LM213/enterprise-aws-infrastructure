variable "app_instance_id" {
  description = "EC2 instance ID for monitoring"
  type        = string
}
variable "alert_email" {
  description = "Email address that will receive CloudWatch alert notifications"
  type        = string
}