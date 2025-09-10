resource "aws_vpc" "main" {
  cidr_block           = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.project_name
  }
}

resource "aws_subnet" "subnets_public" {
  count      = 3
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, count.index)
  # bloco de ips, marcara de rede, numero do subnet
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = var.project_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.project_name
  }
}

resource "aws_route_table" "route_table_local" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = aws_vpc.main.cidr_block
    gateway_id = "local"
  }

  tags = {
    Name = var.project_name
  }
}

#resource "aws_route_table" "route_table_public" {
#  vpc_id = aws_vpc.main.id
#
#  route {
#    cidr_block = aws_vpc.main.cidr_block
#    gateway_id = aws_internet_gateway.igw.id
#  }
#
#  tags = {
#    Name = var.project_name
#  }
#}

resource "aws_route_table_association" "rt_association_public" {
  count          = length(aws_subnet.subnets_public)
  subnet_id      = aws_subnet.subnets_public[count.index].id
  route_table_id = aws_route_table.route_table_local.id
  depends_on = [
    aws_subnet.subnets_public
  ]
}
