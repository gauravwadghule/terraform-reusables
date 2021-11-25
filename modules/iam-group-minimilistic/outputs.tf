output "group_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = join("", aws_iam_group.default.*.arn)
}

output "group_name" {
  description = "The ARN assigned by AWS for this user"
  value       = aws_iam_group.default.name
}