
#create a vpc resource
resource "aws_vpc" "vpc" {
  cidr_block       =  var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project}-${var.env}-vpc"
  }
}


resource "aws_db_subnet_group" "db_subnet_group" {
  count = 1

  name = "${var.project}-${var.env}-db-subnet-group"
  subnet_ids = aws_subnet.private_subnet[*].id

  tags = {
    Name = "${var.project}-${var.env}-db-subnet-group"
  }  
}