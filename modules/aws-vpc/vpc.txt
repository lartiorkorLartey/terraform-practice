# vpc
resource "aws_vpc" "ddk_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy

  tags = {
    Name = var.vpc_name
  }
}

# resource "aws_default_vpc" "default" {
#   tags = {
#     Name = "Default VPC"
#   }
# }

# subnet
resource "aws_subnet" "ddk_subnet_1" {
  vpc_id            = aws_vpc.ddk_vpc.id
  cidr_block        = var.cidr_block
  availability_zone = var.aws_az

  tags = {
    Name = var.ddk_subnet_1
  }
}

# igw
resource "aws_internet_gateway" "myapp-igw" {
  vpc_id = aws_vpc.ddk_vpc.id
}

# route table
resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.ddk_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }

  # tags = {
  #   Name = "${var.env_prefix}-main-rtb"
  # }
}

# rtb ass
resource "aws_route_table_association" "a-rtb-subnet" {
  subnet_id      = aws_subnet.ddk_subnet_1.id
  route_table_id = aws_default_route_table.main-rtb.id
}

resource "aws_security_group" "myapp-sg" {
  name   = "myapp-sg"
  vpc_id = aws_vpc.ddk_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  # tags = {
  #   Name = "${var.env_prefix}-sg"
  # }
}
