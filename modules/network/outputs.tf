#----------Network-----------------
output "all_av_zones" {
  value = data.aws_availability_zones.available.names[*]
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "efs_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "db_subnet_name" {
  value = aws_db_subnet_group.db_wordpress.id
}
