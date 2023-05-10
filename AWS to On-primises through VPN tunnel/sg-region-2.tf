resource "aws_security_group" "harsh-viradia-region-2-sg" {
  name = "harsh-viradia-region-2-sg"
  vpc_id = "${aws_vpc.harsh-viradia-region2-vpc.id}"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/16"]
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

    provider = aws.region2  
    tags = {
        "Name" = "harsh-viradia-region-2-sg"
    }
}
