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

resource "aws_db_instance" "default" {
# Allocating the storage for database instance.
  allocated_storage    = 10
# Declaring the database engine and engine_version
  engine               = "mysql"
  engine_version       = "5.7"
# Declaring the instance class
  instance_class       = "db.t2.micro"
  db_name              = "demodb"
# User to connect the database instance 
  username             = "demo"
# Password to connect the database instance 
  password             = "demo_password"
  parameter_group_name = "default.mysql5.7"
}
