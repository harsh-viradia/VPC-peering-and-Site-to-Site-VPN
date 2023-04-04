module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"
  load_balancer_type = "application"
  name = "harsh-viradia-alb"
  vpc_id = "${aws_vpc.harsh-viradia-security-vpc.id}" 
  subnets = [aws_subnet.harsh-viradia-public-subnet-1.id, aws_subnet.harsh-viradia-public-subnet-2.id]
  internal = false
  create_security_group= false
  security_groups = [aws_security_group.harsh-viradia-security-sg.id]
  

  target_groups = [
    {
        name_prefix = "harsh-"
        backend_protocol = "HTTP"
        stickiness       = { "enabled" = true, "type" = "lb_cookie" }
        peer_vpc_id = "${aws_vpc.harsh-viradia-security-vpc.id}"
        backend_port = 80
        target_type = "ip"
        targets = {
            my_target = {
            availability_zone = "${aws_subnet.harsh-viradia-private-subnet-1.availability_zone}"
            target_id = join("",data.aws_network_interface.ifs.0.private_ips)
            port = 80
            }
            my_other_target = {
            availability_zone = "${aws_subnet.harsh-viradia-private-subnet-2.availability_zone}"
                target_id = join("",data.aws_network_interface.ifs.1.private_ips)
                port = 80
            }
        }
    }
  ]

  depends_on = [aws_vpc.harsh-viradia-security-vpc]

  http_tcp_listeners = [
    {
        port = 80
        protocol = "HTTP"
    }
  ]

  tags = {
    "Name" = "harh-viradia-nlb"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}