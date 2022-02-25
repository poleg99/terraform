#----------General--------------
variable "zone_name" {
  default     = "us-west-2"
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

variable "tf_s3_bucket_store" {
  default     = "terraform-state-op"
  description = "set bucket to store tf state"
}

variable "tf_s3_bucket_key" {
  default     = "epam/aws_task/terraform.tfstate"
  description = "key for bucket where to store tf state"
}
