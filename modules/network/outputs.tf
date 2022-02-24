#----------Network-----------------
output "all_av_zones" {
  value       = data.aws_availability_zones.available.names[*]
  description = "list of all av zones"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "created VPC_ID"
}

output "vpc_cidr" {
  value       = aws_vpc.main.cidr_block
  description = "created VPC CIDR block"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "public subnets id"
}

output "efs_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "efs subnets id"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnets[*].id
  description = "private subnets id"
}

output "db_subnet_name" {
  value       = aws_db_subnet_group.db_wordpress.id
  description = "db subnet name"
}
