terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}

//Define S3 Resource
resource "aws_s3_bucket" "mybucket" {
  bucket = "s3bucket-taufiq"
}

//Configure ACL
resource "aws_s3_bucket_acl" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = "private"
}

//Enable versioning
resource "aws_s3_bucket_versioning" "mybucket" {
    bucket = aws_s3_bucket.mybucket.id
    versioning_configuration {
    status = "Enabled"
  }
}