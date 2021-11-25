resource "aws_iam_group" "default" {
  name = var.group_name
  path = var.path
}
