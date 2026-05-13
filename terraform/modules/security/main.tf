resource "aws_security_group" "app" {
  name        = "changeis-app-sg"
  description = "Security group for application resources"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "changeis-app-sg"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}