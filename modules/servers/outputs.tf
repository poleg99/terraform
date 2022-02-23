#------------Servers----------------
output "web_dns_name" {
  value = aws_elb.web.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.wordpressdb.endpoint
}

#-------------EFS---------------------
output "efs_filesystem_endpoint" {
  value = aws_efs_file_system.efs.id
}
