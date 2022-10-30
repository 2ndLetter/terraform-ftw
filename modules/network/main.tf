# Temporary block
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "this" {

  cidr_block = var.cidr

  tags = {
    "Name" = var.tag_name
  }
}


# ToDo:
# - NACLs
# - SGs
