resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet

  tags = {
    Name = "${var.project}-${var.env}-pub-subnet"
  }
}



resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet

  tags = {
    Name = "${var.project}-${var.env}-pvt-subnet"
  }
}


resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-${var.env}-pub-rtb"
  }

}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public_rtb.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-${var.env}-pvt-rtb"
  }  
}

resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private_rtb.id
  subnet_id      = aws_subnet.private_subnet.id
}