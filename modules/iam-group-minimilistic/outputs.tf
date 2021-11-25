output "group_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = join("", aws_iam_group.default.*.arn)
}