terraform {
  experiments = [module_variable_optional_attrs]
}

resource "aws_iam_group" "default" {
  name = var.group_name
  path = var.path
}

resource "aws_iam_group_policy" "my_developer_policy" {
  name  = "my_developer_policy"
  group = aws_iam_group.my_developers.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(var.iam_policy)
}