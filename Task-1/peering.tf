resource "aws_vpc_peering_connection" "harsh-viradia-vpc-peering" {
  vpc_id = aws_vpc.harsh-viradia-security-vpc.id
  peer_vpc_id = aws_vpc.harsh-viradia-web-vpc.id
  auto_accept = true
}