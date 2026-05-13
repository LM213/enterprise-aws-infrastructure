resource "aws_security_group" "database" {
  name        = "changeis-database-sg"
  description = "Security group for RDS database"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL from application security group"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.app_security_group_id]
  }


  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "changeis-database-sg"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}
resource "aws_db_subnet_group" "database" {
  name       = "changeis-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "changeis-db-subnet-group"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}
resource "aws_db_instance" "database" {
  identifier             = "changeis-project-db"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "changeisdb"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.database.name
  vpc_security_group_ids = [aws_security_group.database.id]
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name        = "changeis-project-db"
    Environment = "dev"
    Project     = "changeis-senior-cloud-project"
  }
}