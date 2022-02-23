provider "aws" {
  region = var.zone_name
}

terraform {
  backend "s3" {
    bucket = "terraform-state-op"
    key    = "epam/aws_task/terraform.tfstate"
    region = "us-west-2"
  }
}

module "epam_task_network" {
  source    = "../modules/network"
  zone_name = var.zone_name
}

module "epam_task_servers" {
  source          = "../modules/servers"
  zone_name       = var.zone_name
  vpc_id_data     = module.epam_task_network.vpc_id
  db_subnet_name  = module.epam_task_network.db_subnet_name
  nlb_subnets     = module.epam_task_network.public_subnet_ids
  servers_subnets = tolist(module.epam_task_network.public_subnet_ids)
  efs_subnets     = module.epam_task_network.efs_subnet_ids
}
