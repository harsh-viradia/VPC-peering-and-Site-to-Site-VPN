module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  name = "harsh-viradia-nlb"
  version = "~> 8.0"
  load_balancer_type = "network"

  vpc_id = "${aws_vpc.harsh-viradia-web-vpc.id}" 
  subnets = [aws_subnet.harsh-viradia-private-subnet-1.id, aws_subnet.harsh-viradia-private-subnet-2.id]
  internal = true

  target_groups = [
    {
        name_prefix = "harsh-"
        backend_protocol = "TCP"
        backend_port = 80
        target_type = "ip"
        targets = {
            my_target = {
            target_id = "${aws_instance.harsh-viradia-private-instance-A.private_ip}"
            port = 80
            }
            my_other_target = {
                target_id = "${aws_instance.harsh-viradia-private-instance-B.private_ip}"
                port = 80
            }
        }
    }
  ]

  http_tcp_listeners = [
    {
        port = 80
        protocol = "TCP"
    }
  ]

  tags = {
    "Name" = "harh-viradia-nlb"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}

