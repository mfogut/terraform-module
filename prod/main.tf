provider "aws" {
  region = "us-east-1"
}

module "prod_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "172.16.0.0/16"
  tenancy     = "default"
  subnet_cidr = "172.16.0.0/24"
  vpc_id      = module.prod_vpc.vpc_id
}

module "prod_ec2" {
  source    = "../modules/ec2"
  ec2_count = "1"
  subnet_id = module.prod_vpc.subnet_id
}
