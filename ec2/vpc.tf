// Membuat VPC
resource "aws_vpc" "my_vpc" {
 cidr_block = "10.10.0.0/16"
 enable_dns_hostnames = true
}

// Membuat Subnet Private
resource "aws_subnet" "subnet-private" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.10.10.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
      Name = "Subnet Private"
      Environment = "Development"
  }
}

// Membuat Subnet Public
resource "aws_subnet" "subnet-public" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.10.100.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
      Name = "Subnet Public"
      Environment = "Development"
  }
}

// Security Group private
resource "aws_security_group" "SG_Private" {
    name        = "Security Group Private"
    description = "inbound traffic for Private"
    vpc_id      = "${aws_vpc.my_vpc.id}"

// Rules ingress Private
ingress  {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

ingress  {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

ingress  {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}
// Allow all traffic
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

// Security Group public
resource "aws_security_group" "SG_Public" {
    name        = "Security Group Public"
    description = "inbound traffic for public"
    vpc_id      = "${aws_vpc.my_vpc.id}"

// Rules ingress public
ingress  {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

ingress  {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

// Allow all traffic
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
