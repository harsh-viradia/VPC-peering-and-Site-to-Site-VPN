resource "aws_instance" "harsh-viradia-private-instance-A" {
  ami = data.aws_ami.web_ami.id

  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.harsh-viradia-private-subnet-1.id}"
  availability_zone = "${aws_subnet.harsh-viradia-private-subnet-1.availability_zone}"
  security_groups = [aws_security_group.harsh-viradia-web-sg.id]
  associate_public_ip_address = true

  user_data = <<EOF
#!bin/bash
sudo su
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Call from instance 1" << /var/www/html/index.html
  EOF

  tags = {
    "Name" = "harsh viradia private instacne A"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}

resource "aws_instance" "harsh-viradia-private-instance-B" {
  ami = data.aws_ami.web_ami.id

  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.harsh-viradia-private-subnet-2.id}"
  availability_zone = "${aws_subnet.harsh-viradia-private-subnet-2.availability_zone}"
  security_groups = [aws_security_group.harsh-viradia-web-sg.id]
  associate_public_ip_address = true

  user_data = <<EOF
#!bin/bash
sudo su
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Call from instance 1" << /var/www/html/index.html
  EOF

  tags = {
    "Name" = "harsh viradia private instacne B"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}