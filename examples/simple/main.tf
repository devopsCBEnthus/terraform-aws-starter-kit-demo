terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "../../modules/vpc"
  name               = var.project
  cidr_block         = "10.0.0.0/16"
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = true
  tags               = { Project = var.project }
}

# EC2 and S3 modules available in full version
# module "ec2" { ... }
# module "s3"  { ... }
