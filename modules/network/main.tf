#provider "aws" {
#  region = "us-east-1"
#}

resource "aws_vpc" "this" {

  cidr_block = var.cidr

  tags = {
    "Name" = var.tag_name
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.0.0/27"

  tags = {
    "Name" = "tf-ftw-subnet-private"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "route-table-private"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.0.32/27"

  tags = {
    "Name" = "tf-ftw-subnet-public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "route-table-public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "tf-ftw"
  }
}

# ToDo:
# - Routes (Public/Private)
# - Security Groups

