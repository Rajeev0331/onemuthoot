resource "aws_vpc" "onemuthoot" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "onemuthoot"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.onemuthoot.id
  cidr_block = var.cidrpub1
  availability_zone = var.az1
  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.onemuthoot.id
  cidr_block = var.cidrpub2
  availability_zone = var.az2
  tags = {
    Name = "public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.onemuthoot.id
  cidr_block = var.cidrpr1
  availability_zone = var.az1
  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.onemuthoot.id
  cidr_block = var.cidrpr2
  availability_zone = var.az2
  tags = {
    Name = "private2"
  }
}

