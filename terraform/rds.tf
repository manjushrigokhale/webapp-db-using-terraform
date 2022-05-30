# Creating RDS Instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-1.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage        = 256 # gigabytes
  backup_retention_period  = 7   # in days
  db_subnet_group_name     = aws_db_subnet_group.default.id
  engine                   = "postgres"
  engine_version           = "9.5.4"
  identifier               = "mydb"
  instance_class           = "db.t2.micro"
  multi_az                 = true
  name                     = "mydb"
  password                 = "${trimspace(file("${path.module}/secrets/mydb1-password.txt"))}"
  port                     = 5432
  publicly_accessible      = true
  storage_encrypted        = true # you should always do this
  storage_type             = "gp2"
  username                 = "username"
  vpc_security_group_ids   = [aws_security_group.database-sg.id]
}