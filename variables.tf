# access keys
variable "aws_access_key" {}
variable "aws_access_key_id" {}

# ec2
variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "associate_public_ip" {}
# variable "sec_grp" {}

# ebs
variable "ebs_volume" {}
variable "aws_az" {}
variable "volume_size" {}
variable "instance_ip" {}

# attachment
variable "device_name" {}

# vpc
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "vpc_tenancy" {}

# subnet
variable "ddk_subnet_1" {}
variable "cidr_block" {}

# s3 bucket
variable "s3_bucket" {}
variable "bucket_name" {}
variable "s3_environment" {}

# iam
variable "iam_role" {}
variable "iam_policy" {}
variable "instance_profile" {}

# dynamodb
variable "table_name" {}
variable "billing_mode" {}
variable "hash_key" {}
variable "range_key" {}
variable "attribute_1_name" {}
variable "attribute_1_type" {}
variable "attribute_2_name" {}
variable "attribute_2_type" {}
variable "ttl_attribute_name" {}
variable "ttl_enabled" {}
variable "gs_index_name" {}
variable "gs_index_hash_key" {}
variable "gs_index_range_key" {}
variable "gs_index_projection_type" {}
variable "tag_name" {}
variable "dynamodb_environment" {}

# codedeploy
variable "codedeploy_role_name" {}
variable "codedeploy_app_name" {}
variable "deployment_group_name" {}
variable "ec2_tag1_key" {}
variable "ec2_tag1_value" {}
variable "ec2_tag1_type" {}

# route53
variable "zone_name" {}
variable "record_name" {}
variable "record_type" {}
variable "record_ttl" {}
# variable "instance_ip" {}