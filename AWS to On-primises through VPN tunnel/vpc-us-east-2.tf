resource "aws_vpc" "harsh-viradia-region2-vpc" {
    cidr_block = "11.0.0.0/16"
    tags = {
      "Name" = "Harsh-Viradia-Second-Region"
      "Owner" = "harsh.viradia@intuitive.cloud"
    }
    provider = aws.region2
}

resource "aws_subnet" "harsh-viradia-subnet-region2" {
    vpc_id = "${aws_vpc.harsh-viradia-region2-vpc.id}"
    cidr_block = "11.0.1.0/24"
    availability_zone = "us-east-2a"
    tags = {
        "Name" = "Harsh-Viradia-Second-Region"
        "Owner" = "harsh.viradia@intuitive.cloud"
    }
    provider = aws.region2
}

resource "aws_route_table" "harsh-viradia-route-table-region2" {
  vpc_id = "${aws_vpc.harsh-viradia-region2-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harsh-viradia-igw-region2.id
  }

  tags = {
        "Name" = "Harsh-Viradia-Second-Region-rt"
        "Owner" = "harsh.viradia@intuitive.cloud"
    }

  provider = aws.region2
}

resource "aws_route_table_association" "harsh-viradia-private-subnet-2-region2" {
  subnet_id      = aws_subnet.harsh-viradia-subnet-region2.id
  route_table_id = aws_route_table.harsh-viradia-route-table-region2.id
  provider = aws.region2
}

resource "aws_internet_gateway" "harsh-viradia-igw-region2" {
  vpc_id = "${aws_vpc.harsh-viradia-region2-vpc.id}"

  provider = aws.region2
  tags = {
        "Name" = "Harsh-Viradia-Second-Region"
        "Owner" = "harsh.viradia@intuitive.cloud"
    }
}