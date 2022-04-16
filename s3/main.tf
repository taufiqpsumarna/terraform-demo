terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "default" {
  bucket = "TF Bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Development"
  }
}