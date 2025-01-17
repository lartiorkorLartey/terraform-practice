output "codedeploy_role_arn" {
  value = aws_iam_role.codedeploy_role.arn
}

output "codedeploy_instance_profile" {
  value = aws_iam_instance_profile.instance_profile.name
}