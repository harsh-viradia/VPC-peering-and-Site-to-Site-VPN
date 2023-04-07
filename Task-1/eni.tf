############################################################################################################################################
############################################################################################################################################
####                                                                                                                                    ####
####                    Fetech network interface private ip addresses of network load balancer for providing as targert group of        ####
####                    application load balancer                                                                                       ####
####                                                                                                                                    ####
############################################################################################################################################
############################################################################################################################################

data "aws_network_interfaces" "this" {
 filter {
 name = "description"
 values = ["ELB net/harsh-viradia-nlb/*"]
}

filter {
 name = "vpc-id"
 values = ["${aws_vpc.harsh-viradia-web-vpc.id}"]
}

filter {
 name = "status"
 values = ["in-use"]
}

filter {
name = "attachment.status"
values = ["attached"]
}
}

locals {
 nlb_interface_ids = "${flatten(["${data.aws_network_interfaces.this.ids}"])}"
}

data "aws_network_interface" "ifs" {
 count = 2
 id = "${local.nlb_interface_ids[count.index]}"
}

output "aws_lb_network_interface_ips" {
 value = join("",data.aws_network_interface.ifs.0.private_ips)
}


