resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging.id
  }


  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "pub_sub_1" {
  subnet_id      = aws_subnet.staging_pub_1.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_sub_2" {
  subnet_id      = aws_subnet.staging_pub_2.id
  route_table_id = aws_route_table.pub_rt.id
}

########### private route #######

resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.staging.id
  }


  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "pri_sub_1" {
  subnet_id      = aws_subnet.staging_pri_1.id
  route_table_id = aws_route_table.pri_rt.id
}

resource "aws_route_table_association" "pri_sub_2" {
  subnet_id      = aws_subnet.staging_pri_2.id
  route_table_id = aws_route_table.pri_rt.id
}