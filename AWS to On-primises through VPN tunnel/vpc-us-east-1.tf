resource "aws_vpc" "harsh-viradia-region1" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "Harsh-Viradia-First-Region"
      "Owner" = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_subnet" "harsh-viradia-subnet-region1" {
    vpc_id = aws_vpc.harsh-viradia-region1.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "Harsh-Viradia-First-Region"
        "Owner" = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_internet_gateway" "harsh-viradia-igw-region1" {
  vpc_id = aws_vpc.harsh-viradia-region1.id

  tags = {
        "Name" = "Harsh-Viradia-First-Region"
        "Owner" = "harsh.viradia@intuitive.cloud"
    }
}


resource "aws_route_table" "harsh-viradia-route-table-region1" {
  vpc_id = aws_vpc.harsh-viradia-region1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harsh-viradia-igw-region1.id
  }

    tags = {
        "Name" = "Harsh-Viradia-First-Region-rt"
        "Owner" = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_route_table_association" "harsh-viradia-private-subnet-1-region1" {
  subnet_id      = aws_subnet.harsh-viradia-subnet-region1.id
  route_table_id = aws_route_table.harsh-viradia-route-table-region1.id
}

resource "aws_vpn_gateway_route_propagation" "harsh-viradia-route-propogation" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = aws_route_table.harsh-viradia-route-table-region1.id
}