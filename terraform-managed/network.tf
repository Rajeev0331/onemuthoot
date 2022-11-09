resource "aws_internet_gateway" "onemuthoot-igw" {
  vpc_id = aws_vpc.onemuthoot.id

  tags = {
    Name = "onemuthootigw"
  }
}

resource "aws_route_table" "onemuthootpublicrt" {
    vpc_id = "${aws_vpc.onemuthoot.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.onemuthoot-igw.id}" 
    }
    
    tags = {
        Name = "onemuthoot-publicRT"
    }
}

resource "aws_route_table_association" "public1"{
    subnet_id = "${aws_subnet.public1.id}"
    route_table_id = "${aws_route_table.onemuthootpublicrt.id}"
}

resource "aws_route_table_association" "public2"{
    subnet_id = "${aws_subnet.public2.id}"
    route_table_id = "${aws_route_table.onemuthootpublicrt.id}"
}

resource "aws_security_group" "onemuth" {
  name        = "onemuth"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.onemuthoot.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] 
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}