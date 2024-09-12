# Create a VPC
resource "aws_vpc" "staging" {
  cidr_block = var.staging_vpc_cidr
  tags = {
    Name        = "staging-vpc"
    Environment = "staging"
  }
}

resource "aws_internet_gateway" "staging" {
  vpc_id = aws_vpc.staging.id

  tags = {
    name = "staging-igw"

  }

}

resource "aws_nat_gateway" "staging" {
  allocation_id = aws_eip.natgw_eip.id
  subnet_id     = aws_subnet.staging_pub_1.id

  tags = {
    Name = "staging-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.staging]
}

resource "aws_eip" "natgw_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.staging]

}

