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
    key = "environments/prod/terraform.tfstate"
  }
}

module "network" {
  source = "../../modules/network"

  cidr     = "10.0.1.0/24"
  priv_sub = "10.0.1.0/27"
  pub_sub  = "10.0.1.32/27"
  project  = "tf-ftw"
  env      = "prod"
}
