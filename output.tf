output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnets_cidr" {
  value = aws_subnet.subnets_public[*].cidr_block
}

output "subnet_ids" {
  value = aws_subnet.subnets_public[*].id
}