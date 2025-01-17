# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["codedeploy.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "codedeploy_role" {
#   name               = var.codedeploy_role_name
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
#   role       = aws_iam_role.codedeploy_role.name
# }

# resource "aws_codedeploy_app" "codedeploy-app" {
#   name = var.codedeploy_app_name
# }

resource "aws_codedeploy_deployment_group" "deployment_groups" {
  app_name              = var.codedeploy_app_name
  deployment_group_name = var.deployment_groups
  service_role_arn      = var.codedeploy_role_arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = var.ec2_filter_name
    }
  }
}
