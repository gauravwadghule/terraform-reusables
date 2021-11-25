resource "aws_iam_user" "default" {
  name                 = var.user_name
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  force_destroy        = var.force_destroy
  tags                 = var.tags
}

// Add this user to given IAM groups.
resource "aws_iam_user_group_membership" "default" {
  count      =  length(var.groups) > 0 ? 1 : 0
  user       = aws_iam_user.default.name
  groups     = var.groups
  depends_on = [aws_iam_user.default]
}
