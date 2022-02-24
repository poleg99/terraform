#----------General--------------
variable "zone_name" {
  default     = "eu-west-2"
  description = "set zone for infrastructure creation"
}

variable "env" {
  default     = "dev"
  description = "set stages"
}

variable "tags" {
  default = {
    Owner   = "Oleg Pavlov"
    Project = "EPAM DEVOPS SCHOOL AWS TASK"
  }
  description = "common tags"
}
