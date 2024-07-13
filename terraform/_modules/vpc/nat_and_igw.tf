resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project}-${var.env}-nat-eip"
  }  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-${var.env}-internet-gateway"
  }
}


resource "aws_nat_gateway" "nat" {
  count = 1
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "${var.project}-${var.env}-nat-gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}


resource "aws_route" "route_for_nat" {
  count = 1
  route_table_id         = aws_route_table.private_rtb[0].id
  nat_gateway_id         = aws_nat_gateway.nat[0].id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "route_for_igw" {
  count = 1
  route_table_id         = aws_route_table.public_rtb[0].id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}