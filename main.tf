terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "eu-west-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_access_key
}

module "vpc" {
  source = "./modules/aws-vpc"

  vpc_name     = var.vpc_name
  vpc_cidr     = var.vpc_cidr
  vpc_tenancy  = var.vpc_tenancy
  ddk_subnet_1 = var.ddk_subnet_1
  cidr_block   = var.cidr_block
  aws_az       = var.aws_az
}

module "ec2" {
  source = "./modules/aws-ec2"

  instance_name = var.instance_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
  ebs_volume    = var.ebs_volume
  aws_az        = var.aws_az
  volume_size   = var.volume_size
  device_name   = var.device_name
  subnet_id     = module.vpc.subnet_id
}

module "s3" {
  source = "./modules/aws-s3"

  s3_bucket   = var.s3_bucket
  bucket_name = var.bucket_name
  environment = var.environment
}
