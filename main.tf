provider "aws" {
  region = "us-east-1"  # 任意のリージョンに変更可能
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "terraform-codebuild-demo-${random_string.bucket_suffix.result}"
  tags = {
    Environment = "Dev"
    Project     = "Terraform Demo2"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.bucket
}
