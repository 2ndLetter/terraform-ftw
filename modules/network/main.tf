# Temporary block
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "tf-ftw"

  }
}

terraform {
  backend "s3" {
    key = "modules/network/terraform.tfstate"
  }
}

# NACLs
# SGs
