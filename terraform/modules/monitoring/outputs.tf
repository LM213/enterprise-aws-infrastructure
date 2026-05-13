output "sns_topic_arn" {
  description = "ARN of the SNS topic used for CloudWatch alerts"
  value       = aws_sns_topic.alerts.arn
}

output "high_cpu_alarm_name" {
  description = "Name of the EC2 high CPU CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}