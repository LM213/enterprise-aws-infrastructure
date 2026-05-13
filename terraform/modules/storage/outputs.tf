output "project_bucket_name" {
  description = "Name of the project S3 bucket"
  value       = aws_s3_bucket.project_bucket.bucket
}

output "project_bucket_arn" {
  description = "ARN of the project S3 bucket"
  value       = aws_s3_bucket.project_bucket.arn
}