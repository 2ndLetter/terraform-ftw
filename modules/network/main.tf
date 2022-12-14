resource "aws_vpc" "this" {

  cidr_block = var.cidr

  tags = {
    "Name" = "${var.project}-vpc-${var.env}"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.priv_sub

  tags = {
    "Name" = "${var.project}-subnet-private-${var.env}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    "Name" = "${var.project}-route-table-private-${var.env}"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub_sub

  tags = {
    "Name" = "${var.project}-subnet-public-${var.env}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    "Name" = "${var.project}-route-table-public-${var.env}"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "${var.project}-igw-${var.env}"
  }
}

resource "aws_nat_gateway" "this" {
  subnet_id         = aws_subnet.public.id
  connectivity_type = "private"

  tags = {
    "Name" = "${var.project}-ngw-${var.env}"
  }
}