#----------General--------------
variable "zone_name" {
  default = "eu-west-2"
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
