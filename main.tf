# Define o provedor AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Chama o módulo da VPC
module "vpc" {
  source                   = "./modules/vpc"
  vpc_cidr_block           = "10.0.0.0/16"
  vpc_name                 = "main-vpc"
  public_subnet_cidr_block = "10.0.1.0/24"
}

# Chama o módulo da instância EC2
module "ec2_instance" {
  source                 = "./modules/ec2"
  instance_ami           = "ami-0de716d6197524dd9"
  instance_type          = "t2.micro"
  instance_name          = "exemplo-instancia-ec2"
  subnet_id              = module.vpc.public_subnet_id
  vpc_security_group_ids = [module.vpc.security_group_id]
}

# Alteração para forçar um novo workflow pelo GitHub Actions - 2