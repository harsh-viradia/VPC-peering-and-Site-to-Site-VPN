resource "aws_customer_gateway" "harsh-viradia-cg" {
  bgp_asn    = 65000
  ip_address = aws_instance.harsh-viradia-ec2-region-2.public_ip
  type       = "ipsec.1"

  tags = {
      "Name" = "Harsh-Viradia-customer-gateway"
      "Owner" = "harsh.viradia@intuitive.cloud"
    }
}

output "aws_customer_gateway_public_ip" {
  value = "${aws_instance.harsh-viradia-ec2-region-2.public_ip}"
  # value = module.ec2_instance.public_ip
}