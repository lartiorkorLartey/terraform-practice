# access keys
variable "aws_access_key" {}
variable "aws_access_key_id" {}

# ec2
variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}

# ebs
variable "ebs_volume" {}
variable "aws_az" {}
variable "volume_size" {}

# attachment
variable "device_name" {}

# vpc
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "vpc_tenancy" {}

# subnet
variable "ddk_subnet_1" {}
variable "cidr_block" {}
# variable "aws_az" {}

# s3 bucket
variable "s3_bucket" {}
variable "bucket_name" {}
variable "environment" {}

# iam
variable "iam_role" {}
variable "iam_policy" {}
variable "instance_profile" {}
