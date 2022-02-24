#------------Servers----------------
output "web_lb_url" {
  value       = module.epam_task_servers.web_dns_name
  description = "URL for connection"
}

output "rds_endpoint" {
  value       = module.epam_task_servers.rds_endpoint
  description = "mysql RDS endpoint"
}

#----------Network-----------------
output "all_av_zones" {
  value       = module.epam_task_network.all_av_zones
  description = "list of all av zones"
}

output "vpc_id" {
  value       = module.epam_task_network.vpc_id
  description = "created VPC_ID"
}

output "vpc_cidr" {
  value       = module.epam_task_network.vpc_cidr
  description = "created VPC CIDR block"
}

output "public_subnet_ids" {
  value       = module.epam_task_network.public_subnet_ids
  description = "public subnets id"
}

output "private_subnet_ids" {
  value       = module.epam_task_network.private_subnet_ids
  description = "pricate subnets id"
}

output "db_subnet_ids" {
  value       = module.epam_task_network.db_subnet_name
  description = "DB subnets id"
}

#----------endpoint_full_hostname
output "efs_filesystem_endpoint" {
  value       = module.epam_task_servers.efs_filesystem_endpoint
  description = "EFS endpoint"
}
