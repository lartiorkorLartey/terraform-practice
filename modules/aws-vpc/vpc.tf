# vpc
resource "aws_vpc" "ddk_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy

  tags = {
    Name = var.vpc_name
  }
}

# subnet
resource "aws_subnet" "ddk_subnet_1" {
  vpc_id            = aws_vpc.ddk_vpc.id
  cidr_block        = var.cidr_block
  availability_zone = var.aws_az


  tags = {
    Name = var.ddk_subnet_1
  }
}

# route table
