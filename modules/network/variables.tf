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
#---------Network---------------
variable "vpc_cidr" {
  default     = "10.20.0.0/16"
  description = "vpc subnet id"
}

variable "public_subnet_cidrs" {
  default = [
    "10.20.10.0/24",
    "10.20.20.0/24",
  ]
  description = "public subnets cidr"
}

variable "private_subnet_cidrs" {
  default = [
    "10.20.31.0/24",
    "10.20.32.0/24"
  ]
  description = "private subnets cidr"
}
