resource "aws_iam_role" "ddk_iam_role" {
  name               = var.iam_role
  assume_role_policy = file("${path.module}/iam-role.json")
}

resource "aws_iam_policy" "ddk_iam_policy" {
  name   = var.iam_policy
  policy = file("${path.module}/iam-policy.json")
}

resource "aws_iam_instance_profile" "ddk_instance_profile" {
  name = var.instance_profile
  role = aws_iam_role.ddk_iam_role.name
}
