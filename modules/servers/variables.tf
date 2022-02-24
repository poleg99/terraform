#----------General--------------
variable "zone_name" {
  default     = "us-west-2"
  description = "zone name where to deploy servers"
}

variable "env" {
  default     = "dev"
  description = "environment for infrastructure to deploy"
}

variable "tags" {
  default = {
    Owner   = "Oleg Pavlov"
    Project = "EPAM DEVOPS SCHOOL AWS TASK"
  }
  description = "default tags"
}

#------------Servers--------------------------
variable "vpc_id_data" {
  description = "vpc id for servers"
}

variable "db_subnet_name" {
  type        = string
  description = "subnet name for DB"
}

variable "nlb_subnets" {
  description = "nlb subnets"
}

variable "servers_subnets" {
  type        = list(any)
  description = "servers subnet for deploy"
}

variable "efs_subnets" {
  type        = list(any)
  description = "efs subnet for deploy"
}

variable "web_server_size" {
  description = "EC2 type"
  type        = string
  default     = "t3.micro"
}

variable "db_server_size" {
  description = "db type"
  type        = string
  default     = "db.t3.small"
}

variable "database_name" {
  default     = "wordpressdb"
  description = "database name for wordpress"
}

variable "database_user" {
  default     = "wordpressuser"
  description = "database user for wordpress"
}

variable "database_password" {
  default     = "Passw0rd123!"
  description = "database pass for wordpress db"
}

variable "full_mount_path" {
  default     = "/var/www/html/efs/uploads"
  description = "efs directory full path"
}

variable "wp_upload_path" {
  default     = "/var/www/html/wp-content/uploads"
  description = "full path for symlink where to store images"
}
