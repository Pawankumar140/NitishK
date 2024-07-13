locals {
  len_public_subnets      = max(length(var.public_subnet))
  len_private_subnets     = max(length(var.private_subnet))

    max_subnet_length = max(
        local.len_private_subnets,
        local.len_public_subnets)
}


# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  count = local.len_public_subnets

  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(concat(var.public_subnet, [""]), count.index)
  availability_zone = element(var.azs, count.index)
  
  
  tags = {
      Name = try(
        var.public_subnet_names[count.index],
        format("${var.public_subnet_suffix}-%s", element(var.azs, count.index))
      )
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  count = local.len_private_subnets

  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(concat(var.private_subnet, [""]), count.index)
  availability_zone = element(var.azs, count.index)
  
  
  tags = {
      Name = try(
        var.private_subnet_names[count.index],
        format("${var.private_subnet_suffix}-%s", element(var.azs, count.index))
      )
  }
}

# Create aws public route table
resource "aws_route_table" "public_rtb" {
  count = 1

  vpc_id = aws_vpc.vpc.id
  tags = {
      Name = "${var.public_subnet_suffix}-rtb"      
  }
}


# Create aws private route table
resource "aws_route_table" "private_rtb" {
  count = 1

  vpc_id = aws_vpc.vpc.id
  tags = {
      Name = "${var.private_subnet_suffix}-rtb"      
  }
}


# Create subnet associate with public route table
resource "aws_route_table_association" "public" {
  count = local.len_public_subnets

  route_table_id = aws_route_table.public_rtb[0].id
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
}


# Create subnet associate with private route table
resource "aws_route_table_association" "private" {
  count = local.len_private_subnets

  route_table_id = aws_route_table.private_rtb[0].id
  subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
}