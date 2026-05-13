resource "aws_sns_topic" "alerts" {
  name = "changeis-cloud-alerts"

  tags = {
    Name        = "changeis-cloud-alerts"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}
resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "changeis-ec2-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Triggers when EC2 CPU utilization is greater than 70 percent for 10 minutes"

  dimensions = {
    InstanceId = var.app_instance_id
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]

  tags = {
    Name        = "changeis-ec2-high-cpu"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}