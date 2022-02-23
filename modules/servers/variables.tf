#----------General--------------
variable "zone_name" {
  default = "us-west-2"
}

variable "env" {
  default = "dev"
}

variable "tags" {
  default = {
    Owner   = "Oleg Pavlov"
    Project = "EPAM DEVOPS SCHOOL AWS TASK"
  }
}

#------------Servers--------------------------
variable "vpc_id_data" {}

variable "db_subnet_name" {
  type = string
}

variable "nlb_subnets" {}

variable "servers_subnets" {
  type = list(any)
}

variable "efs_subnets" {
  type = list(any)
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
  default = "wordpressdb"
}

variable "database_user" {
  default = "wordpressuser"
}

variable "database_password" {
  default = "Passw0rd123!"
}

variable "full_mount_path" {
  default = "/var/www/html/efs/uploads"
}

variable "wp_upload_path" {
  default = "/var/www/html/wp-content/uploads"
}
