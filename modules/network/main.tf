data "aws_availability_zones" "available" {}

#-------------Create VPC and Internet Gateway------------------------------------------
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags                 = merge(var.tags, { Name = "${var.env}-vpc" })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.env}-igw" })
}

#-------------Create Public Subnets and Routing----------------------------------------
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = "true"
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags                    = merge(var.tags, { Name = "${var.env}-public-${count.index + 1}" })
}

resource "aws_route_table" "public_subnets" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge(var.tags, { Name = "${var.env}-route-public-subnets" })
}


resource "aws_route_table_association" "public_routes" {
  count          = length(aws_subnet.public_subnets[*].id)
  route_table_id = aws_route_table.public_subnets.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}
#------------------------------------------------------------

#--------------Create Private Subnets------------
resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = "false"
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags                    = merge(var.tags, { Name = "${var.env}-private-${count.index + 1}" })
}

#----------------Create DB subnet group---------------------
resource "aws_db_subnet_group" "db_wordpress" {
  name       = "rds-for-wordpress"
  subnet_ids = aws_subnet.private_subnets[*].id
  tags       = merge(var.tags, { Name = "${var.env}-db-subnet" })
}
