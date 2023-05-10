resource "aws_security_group" "harsh-viradia-region-1-sg" {
  name = "harsh-viradia-region-1-sg"
  vpc_id = aws_vpc.harsh-viradia-region1.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["11.0.0.0/16"]
    }

    ingress {
    from_port   = 0
    to_port     = 65532
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    "Name" = "harsh-viradia-region-1-sg"
  }
}
