terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82"
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
  ddk_subnet_1 = var.ddk_subnet_1
  vpc_tenancy  = var.vpc_tenancy
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
  associate_public_ip   = var.associate_public_ip
  subnet_id     = module.vpc.subnet_id
  sec_grp       = module.vpc.sec_grp
}

# module "s3" {
#   source = "./modules/aws-s3"

#   s3_bucket   = var.s3_bucket
#   bucket_name = var.bucket_name
#   environment = var.environment
# }

module "dynamodb" {
  source = "./modules/aws-dynamodb"

  table_name               = var.table_name
  billing_mode             = var.billing_mode
  hash_key                 = var.hash_key
  range_key                = var.range_key
  attribute_1_name         = var.attribute_1_name
  attribute_1_type         = var.attribute_1_type
  attribute_2_name         = var.attribute_2_name
  attribute_2_type         = var.attribute_2_type
  ttl_attribute_name       = var.ttl_attribute_name
  ttl_enabled              = var.ttl_enabled
  gs_index_name            = var.gs_index_name
  gs_index_hash_key        = var.gs_index_hash_key
  gs_index_range_key       = var.gs_index_range_key
  gs_index_projection_type = var.gs_index_projection_type
  tag_name                 = var.tag_name
  dynamodb_environment     = var.dynamodb_environment
}

module "codedeploy" {
  source = "./modules/aws-codedeploy"

codedeploy_role_name=var.codedeploy_role_name
codedeploy_app_name=var.codedeploy_app_name
deployment_group_name=var.deployment_group_name
ec2_tag1_key=var.ec2_tag1_key
ec2_tag1_value=var.ec2_tag1_value
ec2_tag1_type=var.ec2_tag1_type

}

module "route53" {
  source = "./modules/aws-route53"

  zone_name   = var.zone_name
  record_name = var.record_name
  record_type = var.record_type
  record_ttl  = var.record_ttl
  instance_ip = module.ec2.public_instance_ip
}

# output "ip" {
#   value=module.ec2.public_instance_ip
# }