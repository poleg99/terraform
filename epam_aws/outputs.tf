#------------Servers----------------
output "web_lb_url" {
  value = module.epam_task_servers.web_dns_name
}

output "rds_endpoint" {
  value = module.epam_task_servers.rds_endpoint
}

#----------Network-----------------
output "all_av_zones" {
  value = module.epam_task_network.all_av_zones
}

output "vpc_id" {
  value = module.epam_task_network.vpc_id
}

output "vpc_cidr" {
  value = module.epam_task_network.vpc_cidr
}

output "public_subnet_ids" {
  value = module.epam_task_network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.epam_task_network.private_subnet_ids
}

output "db_subnet_ids" {
  value = module.epam_task_network.db_subnet_name
}

#----------endpoint_full_hostname
output "efs_filesystem_endpoint" {
  value = module.epam_task_servers.efs_filesystem_endpoint
}
