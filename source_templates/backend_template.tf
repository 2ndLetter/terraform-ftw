#S3 backend for TF state file (remote) and DynamoDB for state locking 
terraform {
  required_version = ">=1.3.1"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    bucket  = "S3_BUCKET_NAME"
    key     = "terraformstatefile"
    region  = "us-east-1"
    profile = "default"
    encrypt = true
    dynamodb_table = "tf-state-locks"
  }
}
