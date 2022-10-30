# backend.hcl
bucket         = "S3_BUCKET_NAME"
region         = "us-east-1"
dynamodb_table = "tf-ftw-state-locks"
encrypt        = true