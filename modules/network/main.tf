# Temporary block
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

terraform {
  backend "s3" {
    key = "modules/network/terraform.tfstate"
  }
}