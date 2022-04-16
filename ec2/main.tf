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

//Tiap Region memiliki ID AMI berbeda, sesuaikan ID Ami dengan region
//Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type x64
resource "aws_instance" "AmazonLinux2" {
  count = 1
  ami           = "ami-0c7478fd229861c57"
  instance_type = "t2.micro"
  key_name      = "Taufiq-Ohio"
  subnet_id     = "${aws_subnet.subnet-public.id}"
  security_groups = [aws_security_group.SG_Public.id]
  tags = {
    Name  = "Amazon Linux 2 Server"
    OS = "Amazon Linux 2 x64"
    Environmet = "Development"
  }
}
 
resource "aws_ebs_volume" "AmazonLinux2" {
  availability_zone = "us-east-2a"
  size              = 16
  type = "gp2"
  tags = {
    Name = "AmazonLinux2"
  }
}


//Tiap Region memiliki ID AMI berbeda, sesuaikan ID Ami dengan region
//Ubuntu Server 20.04 LTS (HVM), SSD Volume Type x64
resource "aws_instance" "Ubuntu2004" {
  count = 1
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  key_name      = "Taufiq-Ohio"
  subnet_id     = "${aws_subnet.subnet-public.id}"
  security_groups = [aws_security_group.SG_Public.id]
  tags = {
    Name  = "Ubuntu 20.04 Server"
    OS = "Ubuntu 20.04 LTS x64"
    Environmet = "Development"
  }
}

resource "aws_ebs_volume" "Ubuntu2004" {
  availability_zone = "us-east-2a"
  size              = 16
  type = "gp2"
  tags = {
    Name = "Ubuntu2004"
  }
}
