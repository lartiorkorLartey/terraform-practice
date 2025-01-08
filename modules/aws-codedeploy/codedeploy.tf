data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codedeploy_role" {
  name               = var.codedeploy_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codedeploy_role.name
}

resource "aws_codedeploy_app" "codedeploy-app" {
  name = var.codedeploy_app_name
}

# resource "aws_sns_topic" "sns_topic" {
#   name = "dodokpo-sns-topic"
# }

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name              = aws_codedeploy_app.codedeploy-app.name
  deployment_group_name = var.deployment_group_name
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = var.ec2_tag1_key
      type  = var.ec2_tag1_value
      value = var.ec2_tag1_type
    }

    # ec2_tag_filter {
    #   key   = "filterkey2"
    #   type  = "KEY_AND_VALUE"
    #   value = "filtervalue"
    # }
  }

  #   trigger_configuration {
  #     trigger_events     = ["DeploymentFailure"]
  #     trigger_name       = "example-trigger"
  #     trigger_target_arn = aws_sns_topic.sns_topic.arn
  #   }

  #   auto_rollback_configuration {
  #     enabled = true
  #     events  = ["DEPLOYMENT_FAILURE"]
  #   }

  #   alarm_configuration {
  #     alarms  = ["my-alarm-name"]
  #     enabled = true
  #   }

  #   outdated_instances_strategy = "UPDATE"

}
