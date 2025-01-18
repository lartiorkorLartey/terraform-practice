# module "iam" {
#   source = "./modules/aws-iam"

# }

module "vpc" {
  source = "./modules/aws-vpc"

  sg_tag = var.sg_tag
  aws_az=var.aws_az
  vpc_tag=var.vpc_tag
}

# # codedeploy app
# resource "aws_codedeploy_app" "codedeploy-app" {
#   name = var.codedeploy_app_name
# }

module "ec2_dev" {
  source = "./modules/aws-ec2"

  instance_name  = var.dev_instance
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.subnet_id
  security_group = module.vpc.security_group
  volume_size    = var.volume_size
}

# module "codedeploy_dev" {
#   source = "./modules/aws-codedeploy"

# codedeploy_app_name   = aws_codedeploy_app.codedeploy-app.name
# for_each = toset(var.deployment_groups_dev)
# deployment_groups = each.value
# ec2_filter_name =module.ec2_dev.instance_name.Name
# codedeploy_role_arn = module.iam.codedeploy_role_arn
# }

# module "ec2_staging" {
#   source = "./modules/aws-ec2"

#   instance_name  = var.staging_instance
#   ami_id         = var.ami_id
#   instance_type  = var.instance_type
#   subnet_id      = module.vpc.subnet_id
#   security_group = module.vpc.security_group
#   volume_size    = var.volume_size
# }

# module "codedeploy_staging" {
#   source = "./modules/aws-codedeploy"

# codedeploy_app_name   = aws_codedeploy_app.codedeploy-app.name
# for_each = toset(var.deployment_groups_staging)
# deployment_groups = each.value
# ec2_filter_name =module.ec2_staging.instance_name.Name
# codedeploy_role_arn = module.iam.codedeploy_role_arn
# }

# module "ec2_production" {
#   source = "./modules/aws-ec2"

#   instance_name  = var.prod_instance
#   ami_id         = var.ami_id
#   instance_type  = var.instance_type
#   subnet_id      = module.vpc.subnet_id
#   security_group = module.vpc.security_group
#   volume_size    = var.volume_size
# }

# module "codedeploy_production" {
#   source = "./modules/aws-codedeploy"

# codedeploy_app_name   = aws_codedeploy_app.codedeploy-app.name
# for_each = toset(var.deployment_groups_production)
# deployment_groups = each.value
# ec2_filter_name =module.ec2_production.instance_name.Name
# codedeploy_role_arn = module.iam.codedeploy_role_arn
# }




###############################################################################

# module "codedeploy_bucket" {
#   source = "./modules/aws-s3"

#   bucket_name=var.codedeploy_bucket
# }

# module "cloudfront_bucket" {
#   source = "./modules/aws-s3"

#   bucket_name = var.s3_bucket

# }

# module "cloudfront" {
#   source = "./modules/aws-cloudfront"

#   cache_policy_name      = var.cache_policy_name
#   cloudfront_oac_name    = var.cloudfront_oac_name
#   oac_origin_type        = var.oac_origin_type
#   viewer_protocol_policy = var.viewer_protocol_policy
#   # price_class            = var.price_class
#   cloudfront_environment = var.cloudfront_environment
#   regional_domain_name   = module.cloudfront_bucket.bucket_regional_domain_name
# }

# # bucket policy and cors
# data "aws_caller_identity" "current" {}

# locals {
#   account_id = data.aws_caller_identity.current.account_id
# }

# data "aws_iam_policy_document" "allow_cloudfront_access" {
#   statement {
#     principals {
#       type        = "Service"
#       identifiers = ["cloudfront.amazonaws.com"]
#     }

#     actions = ["s3:GetObject"]

#     resources = [
#       "arn:aws:s3:::${module.cloudfront_bucket.s3_bucket_name}/*",
#     ]

#     condition {
#       test     = "StringEquals"
#       variable = "aws:SourceArn"
#       values   = ["arn:aws:cloudfront::${local.account_id}:distribution/${module.cloudfront.distribution_id}"]
#     }
#   }
# }

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = module.cloudfront_bucket.s3_bucket_id
#   policy = data.aws_iam_policy_document.allow_cloudfront_access.json
# }

# resource "aws_s3_bucket_cors_configuration" "bucket_cors_configuration" {
#   bucket = module.cloudfront_bucket.s3_bucket_id

#   cors_rule {
#     allowed_headers = ["*"]
#     allowed_methods = ["POST", "GET", "PUT", "DELETE", "HEAD"]
#     allowed_origins = ["*"]
#     expose_headers  = []
#     max_age_seconds = 3000
#   }
# }

###############################################################################

# module "dynamodb" {
#   source = "./modules/aws-dynamodb"

#   for_each       = toset(var.table_names)
#   table_names    = each.value
#   hash_key       = var.hash_key
#   range_key      = var.range_key
#   attribute_type = var.attribute_type
#   gs_index_name  = var.gs_index_name
#   tag_name       = var.tag_name
# }

# module "route53" {
#   source = "./modules/aws-route53"

#   zone_name   = var.zone_name
#   record_name = var.record_name
#   record_type = var.record_type
#   record_ttl  = var.record_ttl
#   instance_ip = module.ec2.public_instance_ip
# }
