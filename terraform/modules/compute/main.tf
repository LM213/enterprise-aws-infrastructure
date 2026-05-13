data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
resource "aws_instance" "app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.app_security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>Changeis Senior Cloud Project - EC2 Web Server Running</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "changeis-app-ec2"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}