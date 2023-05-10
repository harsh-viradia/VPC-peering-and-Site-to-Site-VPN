resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.harsh-viradia-region1.id

  tags = {
      "Name" = "Harsh-Viradia-VPN-gateway"
      "Owner" = "harsh.viradia@intuitive.cloud"
    }
}

output "tunnel1_outside_ip_address" {
  value = aws_vpn_connection.harsh-viradia-site-to-site.tunnel1_address
}