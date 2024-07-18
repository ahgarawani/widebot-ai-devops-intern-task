provider "aws" {
  region = var.region
}

module "networking" {
  source = "./networking"
}

module "security_groups" {
  source = "./networking/security_groups"
  vpc_id = module.networking.vpc_id
}

module "kubernetes" {
  source               = "./kubernetes"
  subnet_ids           = module.networking.private_subnet_ids
  vpc_id               = module.networking.vpc_id
  asg_desired_capacity = var.asg_desired_capacity
  asg_max_capacity     = var.asg_max_capacity
  asg_min_capacity     = var.asg_min_capacity
  instance_type        = var.instance_type
}

module "databases" {
  source = "./databases"
}

module "application" {
  source = "./application"
}
