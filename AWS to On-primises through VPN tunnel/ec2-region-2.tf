resource "aws_instance" "harsh-viradia-ec2-region-2" {
  ami = data.aws_ami.rg2_ami.id

  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.harsh-viradia-subnet-region2.id}"
  availability_zone = "${aws_subnet.harsh-viradia-subnet-region2.availability_zone}"
  security_groups = [aws_security_group.harsh-viradia-region-2-sg.id]
  associate_public_ip_address = true
  user_data         = "${file("user_data_script.sh")}"
  provider = aws.region2
  key_name = "harsh-viradia-key-2"

  tags = {
    "Name" = "harsh viradia region-2 instacne"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}

# module "ec2_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = "harsh viradia region-2 instacne"

#   instance_type          = "t2.micro"
#   key_name               = "harsh-viradia-key-2"
#   vpc_security_group_ids = ["${aws_security_group.harsh-viradia-region-2-sg.id}"]
#   subnet_id              = "${aws_subnet.harsh-viradia-subnet-region2.id}"
#   availability_zone = aws_subnet.harsh-viradia-subnet-region2.availability_zone
#   associate_public_ip_address = true
#   providers = {
#     name = "us-east-2"
#    }

#   user_data         = ("${path.module}/user_data_script.sh")


#   tags = {
#     "Name" = "harsh viradia region-2 instacne"
#     "Owner" = "harsh.viradia@intuitive.cloud"
#   }
# }