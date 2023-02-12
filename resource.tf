resource "aws_iam_user" "user3" {
  name = "user-03"
  path = "/"
  tags = {
    "Name" = "user-03"
  }
}

resource "aws_iam_access_key" "key-03" {
  user = aws_iam_user.user3.name
}

resource "aws_vpc" "vpc-03" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "user-03"
  }
}

resource "aws_subnet" "sub-03" {
  vpc_id     = aws_vpc.vpc-03.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "user-03"
  }
}

resource "aws_security_group" "sg-03" {
  name   = "user-03-security"
  vpc_id = aws_vpc.vpc-03.id
  tags = {
    "Name" = "user-03"
  }
}

resource "aws_s3_bucket" "bucket-03" {
  force_destroy = false
  policy_arn    = "arn:aws:iam::638634889293:policy/user-03-policy"
  tags = {
    "Name" = "user-03"
  }
}

resource "aws_instance" "ec2-03" {
  ami                    = "ami-01a4f99c4ac11b03c"
  monitoring             = true
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.sg-03.id]
  subnet_id              = aws_subnet.sub-03.id
  instance_type          = "t2.micro"
  tags = {
    "Name" = "user-03"
  }
}