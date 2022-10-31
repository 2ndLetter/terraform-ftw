terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.37.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    key = "environments/dev/terraform.tfstate"
  }
}

module "network" {
  source = "../../modules/network"

  cidr     = "10.0.0.0/24"
  tag_name = "tf-ftw-dev"
  environment = dev
}

