resource "aws_security_group" "harsh-viradia-web-sg" {
  name = "harsh-viradia-web-sg"
  vpc_id = aws_vpc.harsh-viradia-web-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/18"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "harsh-viradia-web-sg"
  }
}