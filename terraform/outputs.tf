output "vpc_id" {
  description = "ID of the project VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.vpc.private_subnet_id
}
output "app_security_group_id" {
  description = "ID of the application security group"
  value       = module.security.app_security_group_id
}
output "app_instance_id" {
  description = "ID of the application EC2 instance"
  value       = module.compute.app_instance_id
}

output "app_public_ip" {
  description = "Public IP address of the application EC2 instance"
  value       = module.compute.app_public_ip
}
output "project_bucket_name" {
  description = "Name of the project S3 bucket"
  value       = module.storage.project_bucket_name
}

output "project_bucket_arn" {
  description = "ARN of the project S3 bucket"
  value       = module.storage.project_bucket_arn
}
output "database_endpoint" {
  description = "RDS database endpoint"
  value       = module.database.database_endpoint
}

output "database_security_group_id" {
  description = "Security group ID for the RDS database"
  value       = module.database.database_security_group_id
}
output "sns_topic_arn" {
  description = "ARN of the SNS topic used for CloudWatch alerts"
  value       = module.monitoring.sns_topic_arn
}

output "high_cpu_alarm_name" {
  description = "Name of the EC2 high CPU CloudWatch alarm"
  value       = module.monitoring.high_cpu_alarm_name
}