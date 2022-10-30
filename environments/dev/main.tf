#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 4.37.0"
#    }
#  }
#}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    key = "environments/dev/terraform.tfstate"
  }
}

resource "aws_instance" "web" {
  ami           = ami-09d3b3274b6c5d4aa
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}