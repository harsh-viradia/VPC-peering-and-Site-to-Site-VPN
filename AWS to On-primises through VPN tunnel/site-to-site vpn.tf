resource "aws_vpn_connection" "harsh-viradia-site-to-site" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = aws_customer_gateway.harsh-viradia-cg.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
      "Name" = "Harsh-Viradia-site-to-site-connection"
      "Owner" = "harsh.viradia@intuitive.cloud"
    }
  
}

resource "aws_vpn_connection_route" "harsh-viradia-on-primises" {
  destination_cidr_block = "11.0.0.0/16"
  vpn_connection_id      = aws_vpn_connection.harsh-viradia-site-to-site.id
}