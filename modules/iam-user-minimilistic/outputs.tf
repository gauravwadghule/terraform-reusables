output "user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = join("", aws_iam_user.default.*.arn)
}