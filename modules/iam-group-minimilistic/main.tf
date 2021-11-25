terraform {
  experiments = [module_variable_optional_attrs]
}

resource "aws_iam_group" "default" {
  name = var.group_name
  path = var.path
}

resource "aws_iam_group_policy" "dafault" {
  count = var.iam_policy != {} ? 1 : 0
  name  = var.group_policy_name
  group = aws_iam_group.default.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(var.iam_policy)
}