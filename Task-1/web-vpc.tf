############################################################################################################################################
############################################################################################################################################
####                                                                                                                                    ####
####                            Create Web VPC and host two private subnet also create route table and associate                        ####
####                            necessary rules.                                                                                        ####
####                                                                                                                                    ####
############################################################################################################################################
############################################################################################################################################

resource "aws_vpc" "harsh-viradia-web-vpc" {
  cidr_block = "10.0.64.0/18"
  tags = {
    Name = "harsh-viradia-web-vpc"
    Owner = "harsh.viradia@intuitive.cloud"
  }
}

resource "aws_subnet" "harsh-viradia-private-subnet-1" {
    vpc_id = aws_vpc.harsh-viradia-web-vpc.id
    cidr_block = "10.0.65.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "harsh-viradia-web-subnet-1"
      Owner = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_subnet" "harsh-viradia-private-subnet-2" {
    vpc_id = aws_vpc.harsh-viradia-web-vpc.id
    cidr_block = "10.0.66.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "harsh-viradia-web-subnet-2"
      Owner = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_route_table" "harsh-viradia-web-vpc-route-table" {
  vpc_id = aws_vpc.harsh-viradia-web-vpc.id

  route {
    cidr_block = "10.0.0.0/18"
    vpc_peering_connection_id = aws_vpc_peering_connection.harsh-viradia-vpc-peering.id
  }
}

resource "aws_route_table_association" "harsh-viradia-private-subnet-1" {
  subnet_id      = aws_subnet.harsh-viradia-private-subnet-1.id
  route_table_id = aws_route_table.harsh-viradia-web-vpc-route-table.id
}

resource "aws_route_table_association" "harsh-viradia-private-subnet-2" {
  subnet_id      = aws_subnet.harsh-viradia-private-subnet-2.id
  route_table_id = aws_route_table.harsh-viradia-web-vpc-route-table.id
}