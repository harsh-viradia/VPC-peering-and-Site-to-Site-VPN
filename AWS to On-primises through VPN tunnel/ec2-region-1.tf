resource "aws_instance" "harsh-viradia-ec2-region-1" {
  ami = data.aws_ami.rg1_ami.id

  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.harsh-viradia-subnet-region1.id}"
  availability_zone = "${aws_subnet.harsh-viradia-subnet-region1.availability_zone}"
  security_groups = [aws_security_group.harsh-viradia-region-1-sg.id]
  associate_public_ip_address = true
  key_name = "Harsh-Viradia-Key-1"

  tags = {
    "Name" = "harsh viradia region-1 instacne"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}