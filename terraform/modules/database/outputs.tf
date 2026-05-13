output "database_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.database.endpoint
}

output "database_security_group_id" {
  description = "Security group ID for the RDS database"
  value       = aws_security_group.database.id
}