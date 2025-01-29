# access keys
variable "aws_access_key" {}
variable "aws_access_key_id" {}

# vpc
variable "sg_tag" {}
variable "aws_az" {}
variable "vpc_tag" {}

# ec2
variable "dev_instance" {}
variable "staging_instance" {}
variable "prod_instance" {}
variable "ami_id" {}
variable "instance_type" {}
variable "keypair_name" {}

# ebs
variable "volume_size" {}

# codedeploy
variable "codedeploy_app_name" {}
variable "deployment_groups_dev" {
  type = list(string)
}
variable "deployment_groups_staging" {
  type = list(string)
}
variable "deployment_groups_production" {
  type = list(string)
}

# s3 bucket
variable "codedeploy_bucket" {}
variable "s3_bucket" {}
variable "prod_bucket" {}

# cloudfront
variable "cache_policy_name" {}
variable "cloudfront_oac_name" {}
variable "oac_origin_type" {}
variable "viewer_protocol_policy" {}
variable "cloudfront_environment" {}

# dynamodb
variable "table_names" {
  # type = list(string)
}
variable "hash_key" {}
variable "range_key" {}
variable "attribute_type" {}
variable "gs_index_name" {}
variable "tag_name" {}

# route53
variable "zone_name" {}
variable "record_name" {}
variable "record_type" {}
variable "record_ttl" {}

# iam
# variable "iam_role" {}
# variable "iam_policy" {}
# variable "instance_profile" {}
