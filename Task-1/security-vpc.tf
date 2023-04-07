############################################################################################################################################
############################################################################################################################################
####                                                                                                                                    ####
####                            Create Security VPC and host two public subnet also create route table and associate                    ####
####                            necessary rules.                                                                                        ####
####                                                                                                                                    ####
############################################################################################################################################
############################################################################################################################################


resource "aws_vpc" "harsh-viradia-security-vpc" {
  cidr_block = "10.0.0.0/18"
  tags = {
    Name = "harsh-viradia-security-vpc"
    Owner = "harsh.viradia@intuitive.cloud"
  }
}

resource "aws_subnet" "harsh-viradia-public-subnet-1" {
    vpc_id = aws_vpc.harsh-viradia-security-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "harsh-viradia-security-subnet-1"
      Owner = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_subnet" "harsh-viradia-public-subnet-2" {
    vpc_id = aws_vpc.harsh-viradia-security-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "harsh-viradia-security-subnet-1"
      Owner = "harsh.viradia@intuitive.cloud"
    }
}

resource "aws_internet_gateway" "harsh-viradia-igw" {
  vpc_id = aws_vpc.harsh-viradia-security-vpc.id

  tags = {
    "Name" = "harsh-viradia-igw"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}

resource "aws_route_table" "harsh-viradia-security-vpc-route-table" {
  vpc_id = aws_vpc.harsh-viradia-security-vpc.id

  route {
    cidr_block = "10.0.64.0/18"
    vpc_peering_connection_id = aws_vpc_peering_connection.harsh-viradia-vpc-peering.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harsh-viradia-igw.id
  }

   tags = {
    "Name" = "harsh-viradia-public-rt"
    "Owner" = "harsh.viradia@intuitive.cloud"
  }
}

resource "aws_route_table_association" "harsh-viradia-public-subnet-1" {
  subnet_id      = aws_subnet.harsh-viradia-public-subnet-1.id
  route_table_id = aws_route_table.harsh-viradia-security-vpc-route-table.id
}

resource "aws_route_table_association" "harsh-viradia-public-subnet-2" {
  subnet_id      = aws_subnet.harsh-viradia-public-subnet-2.id
  route_table_id = aws_route_table.harsh-viradia-security-vpc-route-table.id
}