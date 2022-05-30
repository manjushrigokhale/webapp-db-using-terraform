# Create Database Security Group
resource "aws_security_group" "database-sg" {
  name = "Database SG"
  description = "RDS postgres servers (terraform-managed)"
  vpc_id = aws_vpc.demovpc.id

  # Only postgres in
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Database SG"
  }
}