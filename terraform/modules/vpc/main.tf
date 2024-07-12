#create a vpc resource
resource "aws_vpc" "vpc" {
  cidr_block       =  var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project}-${var.env}-vpc"
  }
}